<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 客户信息</title>
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
                        <input type="hidden" name="id"  value="${(customer.id)!}" >
                    </div>


                    <div class="layui-form-item" style="margin-top: 10px">
                        <label class="layui-form-label">客户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="khm" lay-verify="required"  placeholder="请输入客户名" value="${(customer.khm)!}"
                                   autocomplete="off" class="layui-input ">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">国家</label>
                        <div class="layui-input-inline">
                            <input type="text" name="gj" lay-verify="required" placeholder="请输入国家" value="${customer.gj}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-inline">
                            <input type="text" name="lxfs" lay-verify="required" placeholder="请输入联系方式" value="${customer.lxfs}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input type="text" name="yx" lay-verify="required" placeholder="请输入邮箱" value="${customer.yx}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">客户地址</label>
                        <div class="layui-input-inline">
                            <input type="text" name="khdz" lay-verify="required" placeholder="客户地址" value="${customer.khdz}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">感兴趣的产品"</label>
                        <div class="layui-input-inline">
                            <input type="text" name="gxqcp" lay-verify="required" placeholder="感兴趣的产品" value="${customer.gxqcp}"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">客户分类"</label>
                        <div class="layui-input-inline">
                            <input type="text" name="khfl" lay-verify="required" placeholder="客户分类" value="${customer.khfl}"
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
    }).use('admin/customer/form');
</script>
</body>

</html>
