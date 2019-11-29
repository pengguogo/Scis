<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 产品信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .layui-form-item{
            margin: 20px 0 0 200px
        }

    </style>
</head>

<body>

<fieldset id="dataList" class="layui-elem-field layui-field-title sys-list-field">
    <legend style="text-align:center;">添加</legend>
</fieldset>
<div class="container-fluid larry-wrapper">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <section class="panel panel-padding">
                <form id="form1" class="layui-form "  lay-filter="form">

                    <div class="layui-form-item">
                        <input type="hidden" name="id"  value="${(product.id)!}" >
                    </div>


                    <div class="layui-form-item" style="margin-top: 10px">
                        <label class="layui-form-label">产品名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="productName" lay-verify="required"  placeholder="请输入产品名称" value="${(product.productName)!}"
                                   autocomplete="off" class="layui-input ">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">产品英文名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="productNameEn" lay-verify="required" placeholder="请输入产品英文名称" value="${product.productNameEn}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">SKU</label>
                        <div class="layui-input-inline">
                            <input type="text" name="sku" lay-verify="required" placeholder="请输入sku" value="${product.sku}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">OE</label>
                        <div class="layui-input-inline">
                            <input type="text" name="oe" lay-verify="required" placeholder="请输入OE号" value="${product.oe}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">重量</label>
                        <div class="layui-input-inline">
                            <input type="text" name="zl"  placeholder="请输入重量" value="${product.zl}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">尺寸</label>
                        <div class="layui-input-inline">
                            <input type="text" name="cc" placeholder="请输入尺寸" value="${product.cc}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">车品牌</label>
                        <div class="layui-input-inline">
                            <input type="text" name="cpp" lay-verify="required" placeholder="请输入车品牌" value="${product.cpp}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">适配型号</label>
                        <div class="layui-input-block">
                            <textarea id="spxh" name="spxh" placeholder="请输入内容：必填" lay-verify="required" class="layui-textarea" style="width: 60%">${(product.spxh)!}</textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="jg" lay-verify="required" placeholder="请输入价格" value="${product.jg}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">满箱数</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mxs"  placeholder="请输入满箱数" value="${product.mxs}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">满箱外箱尺寸</label>
                        <div class="layui-input-inline">
                            <input type="text" name="mxwxcc"  placeholder="请输入满箱外箱尺寸" value="${product.mxwxcc}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-inline">
                            <input type="text" name="bz"  placeholder="请输入重备注" value="${product.bz}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
                    </div>

                </form>
            </section>
        </div>
    </div>
</div>

<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<script src="${ctx!}/js/common.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript">
    layui.config({
        base: '${ctx}/js/'
    }).use('admin/product/form');
</script>
</body>

</html>
