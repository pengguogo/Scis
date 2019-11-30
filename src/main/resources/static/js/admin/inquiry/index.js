layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#inquiry'
        ,height: 'full-200'
        ,method:'GET'
        ,toolbar: true
        ,title: '询盘信息表'
        ,totalRow: true
        ,url: '/admin/inquiry/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'customer',templet: '<div>{{d.customer.khm}}</div> ', align:'center', title: '客户名',unresize:true}
            ,{field: 'cp', align:'center', title: '产品',unresize:true}
            ,{field: 'xssj', align:'center', title: '销售时间',unresize:true}
            ,{field: 'cpje', align:'center', title: '产品金额',unresize:true}
            ,{field: 'ddzje', align:'center', title: '订单总金额',unresize:true}
            ,{field: 'yf', title: '运费',unresize:true}
            ,{field: 'gys', title: '供应商',unresize:true}
            ,{field: 'cgj', title: '采购价',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/admin/inquiry/form?id='+data.id);
        }
    });

    //添加数据
    $('#addinquiry').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品添加','/admin/inquiry/form');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //导出数据
    $('#outinquiry').click(function () {
        window.location.href = "/admin/inquiry/ExcelDownloads";
    });

    //导入数据
    $('#importinquiry').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品导入','/admin/inquiry/importFile');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //批量删除数据
    $('#deleteAll').click(function () {
        var index = layer.load(1);

    });

    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                del(id);
            }, function () {

            });
        },
        editData: function (id) {
            common.frame_show('分类编辑','/admin/inquiry/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/admin/inquiry/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/inquiry/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    var keyword='';
    //搜索
    $('#search').click(function () {
        keyword = $("#keyword").val();
        table.reload('inquiry', {
            url: "/admin/inquiry/search"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    //精确搜索
    $('#search2').click(function () {
        keyword = $("#keyword").val();
        table.reload('inquiry', {
            url: "/admin/inquiry/search2"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    exports('admin/inquiry/index', datalist);
});