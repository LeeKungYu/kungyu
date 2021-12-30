<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="OrderList" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <br />
                                <h2 class="menu-title col-sm-4"><strong>訂單管理</strong></h2>
                            </div>
                            <div class="col-sm-6">

                                <%-- 匯出EXCEL檔 --%>
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-info material-icons" Text="匯出檔案" OnClick="Button2_Click" />

                            </div>
                        </div>

                    </div>
                    <table id="dataTable" class="table table-striped table-hover">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>

                                        <th>訂單編號</th>
                                        <th>訂購時間</th>
                                        <th>收件人姓名</th>
                                        <th>收件人電話</th>
                                        <th>收件人電子信箱</th>
                                        <th>出貨日期</th>
                                        <th>訂單狀態</th>
                                        <th>編輯</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <%-- Date","{0:yyyy/MM/dd} --%>
                                        <td>9048000<%# Eval("OrderID") %></td>
                                        <td><%# Eval("OrderDate") %></td>
                                        <td><%# Eval("ShipName") %></td>
                                        <td><%# Eval("Phone") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td><%# Eval("ShippedDate") %></td>
                                        <td><%#ChangeText( Eval("State")) %></td>
                                        <td>
                                            <a href="#editEmployeeModal" class="edit" data-toggle="modal" onclick='aa(<%#Eval("OrderID") %>)'><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
                                            <a href="<%#Eval("OrderID","/OrderDetail.aspx?id={0}") %> "><i class="ft-more-vertical" data-toggle="tooltip" data-original-title="訂單資訊"></i></a>
                                        </td>

                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>

                    </table>
                    <div class="clearfix">
                        <%--  <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>--%>
                       <%-- <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item active"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item "><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>


        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div>
                        <div class="modal-header ">
                            <h3 class="modal-title menu-title"><strong>修改訂單</strong></h3>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body menu-title ">
                            <div class="form-group">
                                <label>編號</label>
                                <input id="Text1" class="form-control" disabled="disabled" runat="server" />
                                <div class="form-group">
                                    <label>收件人姓名</label>
                                    <input id="Text2" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>收件人地址</label>
                                    <input id="Text3" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>出貨日期</label>
                                    <div class="datetest">
                                        <p class="datag">
                                            <asp:TextBox ID="datepicker" CssClass="form-control" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                    <%--  <input id="Text4" class="form-control" runat="server" type="text" />--%>
                                </div>
                                <div class="form-group">
                                    <label>訂單狀態</label>
                                    <select name="Role" id="state" class="form-control">
                                        <option value="0">收到訂單</option>
                                        <option value="1">處理中</option>
                                        <option value="2">已出貨</option>
                                        <option value="3">完成訂單</option>
                                        <option value="4">結案</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <input type="submit" id="save" class="btn btn-info" value="儲存">
                            <input type="button" id="cancel" class="btn btn-default" data-dismiss="modal" value="取消">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script>
        $(() => {
            $("#dataTable").DataTable();
        });
        function aa(id) {

            $.ajax({

                type: 'POST',
                url: "WebService.asmx/GetOrderList",
                async: false,
                contentType: "application/json;utd-8",
                dataType: "json",
                data: JSON.stringify({ "id": id }),
                success: function (result) {

                    $("#ContentPlaceHolder1_Text1").val(result.d.OrderID);
                    $("#ContentPlaceHolder1_Text2").val(result.d.ShipName);
                    $("#ContentPlaceHolder1_Text3").val(result.d.Address);
                    $("#ContentPlaceHolder1_datepicker").val(result.d.ShippedDate);
                    $('#state').val(result.d.State);
                }
            });
            $("#save").click(function () {

                var mydata = {
                    orderId: $("#ContentPlaceHolder1_Text1").val(),
                    shipName: $("#ContentPlaceHolder1_Text2").val(),
                    address: $("#ContentPlaceHolder1_Text3").val(),
                    shippedDate: $("#ContentPlaceHolder1_datepicker").val(),
                    state: $('#state').val(),
                };

                $.ajax({

                    type: 'POST',
                    url: "WebService.asmx/UpdateForOrder",
                    async: false,
                    contentType: "application/json;utd-8",
                    dataType: "json",
                    data: JSON.stringify(mydata),
                    success: function (result) {
                        location.href = "OrderList.aspx";
                    }
                })
            })
        }

        $(function () {



            $("#ContentPlaceHolder1_datepicker").datepicker({

                //可使用下拉式選單 - 月份

                changeMonth: true,

                //可使用下拉式選單 - 年份

                changeYear: true,

                //設定 下拉式選單月份 在 年份的後面

                showMonthAfterYear: true,
                yearRange: "1930:2021"
            });
        });
        $(function () {

            (function (factory) {

                if (typeof define === "function" && define.amd) {

                    // AMD. Register as an anonymous module.

                    define(["../widgets/datepicker"], factory);

                } else {

                    // Browser globals

                    factory(jQuery.datepicker);

                }

            }(function (datepicker) {

                datepicker.regional["zh-TW"] = {

                    closeText: "關閉",

                    prevText: "&#x3C;上個月",

                    nextText: "下個月&#x3E;",

                    currentText: "今天",

                    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月",

                        "七月", "八月", "九月", "十月", "十一月", "十二月"],

                    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月",

                        "七月", "八月", "九月", "十月", "十一月", "十二月"],

                    dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],

                    dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],

                    dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],

                    weekHeader: "週",

                    dateFormat: "yy年mm月dd日",

                    firstDay: 1,

                    isRTL: false,

                    showMonthAfterYear: true,

                    yearSuffix: "年"
                };

                datepicker.setDefaults(datepicker.regional["zh-TW"]);

                return datepicker.regional["zh-TW"];

            }));

        });


    </script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
</asp:Content>

