package com.jcohy.scis.controller;


import com.jcohy.scis.common.JsonResult;
import com.jcohy.scis.common.PageJson;
import com.jcohy.scis.model.*;
import com.jcohy.scis.service.IMgProductInfoService;
import com.jcohy.scis.service.MajorService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
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
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 产品列表 前端控制器
 * </p>
 *
 * @author pengguo
 * @since 2019-08-27
 */
@Controller
@RequestMapping("/admin/product")
public class MgProductInfoController extends BaseController {

    @Autowired
    private IMgProductInfoService productInfoService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<MgProductInfo> all(ModelMap map) {
        List<MgProductInfo> productInfos = productInfoService.findAll();
        PageJson<MgProductInfo> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(productInfos.size());
        page.setData(productInfos);
        return page;
    }


    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map) {

        if (id != null) {
            MgProductInfo productInfo = productInfoService.findById(id);
            map.put("product", productInfo);
        }
        return "admin/product/form";
    }


    @GetMapping("/importFile")
    public String importFile() {
        return "admin/product/import";
    }


    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(MgProductInfo productInfo) {
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
            List<MgProductInfo> importDatas = new ArrayList<>();
            XSSFRow row = null;
//循环sesheet页中数据从第二行开始，第一行是标题
            for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
//获取每一行数据
                row = sheet.getRow(i);
                MgProductInfo data = new MgProductInfo();
                if (row.getCell(0)==null) break;
                data.setProductName(row.getCell(0).getStringCellValue());
                data.setProductNameEn(row.getCell(1).getStringCellValue());
                data.setSku(row.getCell(2).getStringCellValue());
                row.getCell(3).setCellType(CellType.STRING);
                data.setOe(row.getCell(3).getStringCellValue());
                data.setCpp(row.getCell(4).getStringCellValue());
                data.setSpxh(row.getCell(5).getStringCellValue());
                data.setJg(new BigDecimal(row.getCell(6).getNumericCellValue()).toString());
                data.setZl(new Double(row.getCell(7).getNumericCellValue()).toString());
                data.setCc(row.getCell(8).getStringCellValue());
                data.setMxs(row.getCell(9).getStringCellValue());
                data.setMxwxcc(row.getCell(10).getStringCellValue());
                if (row.getCell(11) != null) {
                    data.setBz(row.getCell(11).getStringCellValue());
                }
                MgProductInfo productInfo = productInfoService.findBySku(row.getCell(2).getStringCellValue());
                if (productInfo!=null){
                    System.out.println("更新"+productInfo.getSku());
                    data.setId(productInfo.getId());
                }
                importDatas.add(data);
                System.out.println(data.toString());
            }
//循环展示导入的数据，实际应用中应该校验并存入数据库
            for (MgProductInfo imdata : importDatas) {
                productInfoService.save(imdata);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "导入成功!";
    }

    /**
     * 精确查询
     *
     * @param keyword
     * @return
     */
    @GetMapping("/search")
    @ResponseBody
    public PageJson search(String keyword) {
        List<MgProductInfo> productInfos = productInfoService.findByKeyword(keyword);
        System.out.println("=============================");
        productInfos.forEach(System.out::println);
        PageJson<MgProductInfo> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(productInfos.size());
        page.setData(productInfos);
        return page;
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
        List<MgProductInfo> productInfos = productInfoService.findByKeywordLike(keyword);
        System.out.println("=============================");
        productInfos.forEach(System.out::println);
        PageJson<MgProductInfo> page = new PageJson<>();
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

        List<MgProductInfo> productInfos = productInfoService.findAll();

        String fileName = "productInfos"  + ".xls";//设置要导出的文件的名字
        //新增数据行，并且设置单元格数据

        int rowNum = 1;

        String[] headers = { "产品名称", "产品名称英文", "SKU", "OE","重量","尺寸","车品牌","适配型号","价格","满箱数","满箱外箱尺寸","备注"};
        //headers表示excel表中第一行的表头

        HSSFRow row = sheet.createRow(0);
        //在excel表中添加表头

        for(int i=0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
//        String[] headers = { "产品名称", "产品名称英文", "SKU", "OE","重量","尺寸","车品牌","适配型号","价格","满箱数","满箱外箱尺寸","备注"};
        //在表中存放查询到的数据放入对应的列
        for (MgProductInfo productInfo : productInfos) {
            HSSFRow row1 = sheet.createRow(rowNum);
            row1.createCell(0).setCellValue(productInfo.getProductName());
            row1.createCell(1).setCellValue(productInfo.getProductNameEn());
            row1.createCell(2).setCellValue(productInfo.getSku());
            row1.createCell(3).setCellValue(productInfo.getOe());
            row1.createCell(4).setCellValue(productInfo.getZl());
            row1.createCell(5).setCellValue(productInfo.getCc());
            row1.createCell(6).setCellValue(productInfo.getCpp());
            row1.createCell(7).setCellValue(productInfo.getSpxh());
            row1.createCell(8).setCellValue(productInfo.getJg());
            row1.createCell(9).setCellValue(productInfo.getMxs());
            row1.createCell(10).setCellValue(productInfo.getMxwxcc());
            row1.createCell(11).setCellValue(productInfo.getBz());

            rowNum++;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName);
        response.flushBuffer();
        workbook.write(response.getOutputStream());
    }

    }
