<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 询盘信息</title>
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
                        <input type="hidden" name="id"  value="${(inquiry.id)!}" >
                    </div>


                    <div class="layui-form-item" style="margin-top: 10px">
                        <label class="layui-form-label">产品</label>
                        <div class="layui-input-inline">
                            <input type="text" name="cp" lay-verify="required"  placeholder="请输入产品名" value="${(inquiry.cp)!}"
                                   autocomplete="off" class="layui-input ">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label" >销售时间</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" name="xssj" id="xssj" value="${(inquiry.xssj)!}" lay-verify="required">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">产品金额</label>
                        <div class="layui-input-inline">
                            <input type="text" name="cpje" lay-verify="required" placeholder="产品金额" value="${inquiry.cpje}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">订单总金额</label>
                        <div class="layui-input-inline">
                            <input type="text" name="ddzje" lay-verify="required" placeholder="请输入订单总金额" value="${inquiry.ddzje}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">运费</label>
                        <div class="layui-input-inline">
                            <input type="text" name="yf" lay-verify="required" placeholder="运费" value="${inquiry.yf}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">供应商</label>
                        <div class="layui-input-inline">
                            <input type="text" name="gys" lay-verify="required" placeholder="供应商" value="${inquiry.gys}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">采购价</label>
                        <div class="layui-input-inline">
                            <input type="text" name="cgj" lay-verify="required" placeholder="采购价" value="${inquiry.cgj}"
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
    }).use('admin/inquiry/form');
</script>
</body>

</html>
