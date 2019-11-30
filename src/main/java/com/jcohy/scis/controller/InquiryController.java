package com.jcohy.scis.controller;


import com.jcohy.scis.common.JsonResult;
import com.jcohy.scis.common.PageJson;
import com.jcohy.scis.model.Inquiry;
import com.jcohy.scis.service.IInquiryService;
import org.apache.poi.hssf.usermodel.*;
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
 * 询盘列表 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2019-11-30
 */
@Controller
@RequestMapping("/admin/inquiry")
public class InquiryController extends BaseController {


    @Autowired
    private IInquiryService productInfoService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Inquiry> all(ModelMap map) {
        List<Inquiry> productInfos = productInfoService.findAll();
        PageJson<Inquiry> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(productInfos.size());
        page.setData(productInfos);
        return page;
    }


    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map) {

        if (id != null) {
            Inquiry productInfo = productInfoService.findById(id);
            map.put("inquiry", productInfo);
        }
        return "admin/Inquiry/form";
    }


    @GetMapping("/importFile")
    public String importFile() {
        return "admin/Inquiry/import";
    }


    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Inquiry productInfo) {
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
            List<Inquiry> importDatas = new ArrayList<>();
            XSSFRow row = null;
//循环sesheet页中数据从第二行开始，第一行是标题
            for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
//获取每一行数据
                row = sheet.getRow(i);
                Inquiry data = new Inquiry();
//                if (row.getCell(0)==null) {break;}
//                data.setGsm(row.getCell(0).getStringCellValue());
//                if (row.getCell(1) != null) {
//                    data.setZycp(row.getCell(1).getStringCellValue());
//                }
//                if (row.getCell(2) != null) {
//                    data.setLxr(row.getCell(2).getStringCellValue());
//                }
//                if (row.getCell(3) != null) {
//                    row.getCell(3).setCellType(CellType.STRING);
//                    data.setLxdh(row.getCell(3).getStringCellValue());
//                }
//                if (row.getCell(5) != null) {
//                    row.getCell(5).setCellType(CellType.STRING);
//                    data.setWx(row.getCell(5).getStringCellValue());
//                }
//                if (row.getCell(6) != null) {
//                    row.getCell(6).setCellType(CellType.STRING);
//                    data.setQq(row.getCell(6).getStringCellValue());
//                }
//                if (row.getCell(7) != null) {
//                    row.getCell(7).setCellType(CellType.STRING);
//                    data.setDz(row.getCell(7).getStringCellValue());
//                }
//                if (row.getCell(8) != null) {
//                    row.getCell(8).setCellType(CellType.STRING);
//                    data.setWz(row.getCell(8).getStringCellValue());
//                }
//                Inquiry productInfo = productInfoService.findByGsm(row.getCell(0).getStringCellValue());
//                if (productInfo!=null){
//                    System.out.println("更新"+productInfo.getGsm());
//                    data.setId(productInfo.getId());
//                }
                importDatas.add(data);
                System.out.println(data.toString());
            }
//循环展示导入的数据，实际应用中应该校验并存入数据库
            for (Inquiry imdata : importDatas) {
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
        List<Inquiry> productInfos = productInfoService.findByKeywordLike(keyword);
        System.out.println("=============================");
        productInfos.forEach(System.out::println);
        PageJson<Inquiry> page = new PageJson<>();
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

        List<Inquiry> productInfos = productInfoService.findAll();

        String fileName = "productInfos"  + ".xls";//设置要导出的文件的名字
        //新增数据行，并且设置单元格数据

        int rowNum = 1;

//        String[] headers = { "产品名称", "产品名称英文", "SKU", "OE","重量","尺寸","车品牌","适配型号","价格","满箱数","满箱外箱尺寸","备注"};
        //headers表示excel表中第一行的表头

        HSSFRow row = sheet.createRow(0);
        //在excel表中添加表头
        String[] headers = { "销售时间", "产品", "产品价格", "订单总金额","运费","供应商","采购价"};


        for(int i=0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        //在表中存放查询到的数据放入对应的列
        for (Inquiry productInfo : productInfos) {
            HSSFRow row1 = sheet.createRow(rowNum);
            row1.createCell(0).setCellValue(productInfo.getXssj().toString());
            row1.createCell(1).setCellValue(productInfo.getCp());
            row1.createCell(2).setCellValue(productInfo.getCpje());
            row1.createCell(3).setCellValue(productInfo.getDdzje());
            row1.createCell(4).setCellValue(productInfo.getYf());
            row1.createCell(5).setCellValue(productInfo.getGys());
            row1.createCell(6).setCellValue(productInfo.getCgj());

            rowNum++;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName);
        response.flushBuffer();
        workbook.write(response.getOutputStream());
    }


}
