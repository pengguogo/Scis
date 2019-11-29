package com.jcohy.scis.controller;

import com.jcohy.scis.common.JsonResult;
import com.jcohy.scis.common.PageJson;
import com.jcohy.scis.model.Customer;
import com.jcohy.scis.service.ICustomerService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 供应商列表 前端控制器
 * </p>
 *
 * @author lqh
 * @since 2019-10-18
 */
@Controller
@RequestMapping("/admin/customer")
public class CustomerController {

    @Autowired
    private ICustomerService productInfoService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Customer> all(ModelMap map) {
        List<Customer> productInfos = productInfoService.findAll();
        PageJson<Customer> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(productInfos.size());
        page.setData(productInfos);
        return page;
    }


    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map) {

        if (id != null) {
            Customer productInfo = productInfoService.findById(id);
            map.put("customer", productInfo);
        }
        return "admin/customer/form";
    }


    @GetMapping("/importFile")
    public String importFile() {
        return "admin/customer/import";
    }


    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Customer productInfo) {
        try {
            productInfoService.save(productInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @DeleteMapping("{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Integer id) {
        try {
            productInfoService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }

    //处理文件上传
    @ResponseBody//返回json数据
    @RequestMapping(value = "/excelImport", method = RequestMethod.POST)
    public String uploadImg(@RequestParam("file") MultipartFile file) {
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();
        if (file.isEmpty()) {
            return "文件为空！";
        }
        try {
//根据路径获取这个操作excel的实例
            XSSFWorkbook wb = new XSSFWorkbook(file.getInputStream());            //根据页面index 获取sheet页
            XSSFSheet sheet = wb.getSheetAt(0);
//实体类集合
            List<Customer> importDatas = new ArrayList<>();
            XSSFRow row = null;
//循环sesheet页中数据从第二行开始，第一行是标题
            for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
//获取每一行数据
                row = sheet.getRow(i);
                Customer data = new Customer();
                if (row.getCell(1)==null) {break;}
                data.setKhm(row.getCell(1).getStringCellValue());
                if (row.getCell(0) != null) {
                    data.setGj(row.getCell(0).getStringCellValue());
                }
                if (row.getCell(2) != null) {
                    row.getCell(2).setCellType(CellType.STRING);
                    data.setLxfs(row.getCell(2).getStringCellValue());
                }
                if (row.getCell(3) != null) {
                    row.getCell(3).setCellType(CellType.STRING);
                    data.setYx(row.getCell(3).getStringCellValue());
                }
                if (row.getCell(4) != null) {
                    data.setGxqcp(row.getCell(4).getStringCellValue());
                }
                if (row.getCell(5) != null) {
                    data.setKhdz(row.getCell(5).getStringCellValue());
                }
                if (row.getCell(6) != null) {
                    data.setKhfl(row.getCell(6).getStringCellValue());
                }

                Customer productInfo = productInfoService.findByKhm(row.getCell(1).getStringCellValue());
                if (productInfo!=null){
                    System.out.println("更新"+productInfo.getKhm());
                    data.setId(productInfo.getId());
                }
                importDatas.add(data);
                System.out.println(data.toString());
            }
//循环展示导入的数据，实际应用中应该校验并存入数据库
            for (Customer imdata : importDatas) {
                productInfoService.save(imdata);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "导入成功!";
    }



    /**
     * 搜索模糊查询
     *
     * @param keyword
     * @return
     */
    @GetMapping("/search2")
    @ResponseBody
    public PageJson search2(String keyword) {
        List<Customer> productInfos = productInfoService.findByKeywordLike(keyword);
        System.out.println("=============================");
        productInfos.forEach(System.out::println);
        PageJson<Customer> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(productInfos.size());
        page.setData(productInfos);
        return page;
    }

    @RequestMapping(value ="/ExcelDownloads")
    public void downloadAll(HttpServletResponse response) throws IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("产品信息表");

        List<Customer> productInfos = productInfoService.findAll();

        String fileName = "productInfos"  + ".xls";//设置要导出的文件的名字
        //新增数据行，并且设置单元格数据

        int rowNum = 1;

//        String[] headers = { "产品名称", "产品名称英文", "SKU", "OE","重量","尺寸","车品牌","适配型号","价格","满箱数","满箱外箱尺寸","备注"};
        //headers表示excel表中第一行的表头

        HSSFRow row = sheet.createRow(0);
        //在excel表中添加表头
        String[] headers = { "客户名", "国家", "联系方式", "邮箱","客户地址","感兴趣的产品","客户分类"};


        for(int i=0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        //在表中存放查询到的数据放入对应的列
        for (Customer productInfo : productInfos) {
            HSSFRow row1 = sheet.createRow(rowNum);
            row1.createCell(0).setCellValue(productInfo.getKhm());
            row1.createCell(1).setCellValue(productInfo.getGj());
            row1.createCell(2).setCellValue(productInfo.getLxfs());
            row1.createCell(3).setCellValue(productInfo.getYx());
            row1.createCell(4).setCellValue(productInfo.getKhdz());
            row1.createCell(5).setCellValue(productInfo.getGxqcp());
            row1.createCell(6).setCellValue(productInfo.getKhfl());

            rowNum++;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName);
        response.flushBuffer();
        workbook.write(response.getOutputStream());
    }

}
