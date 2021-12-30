<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ADiscount.aspx.cs" Inherits="ADiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" runat="Server">
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <br />
                                <h2 class="menu-title col-sm-4"><strong>促銷管理</strong></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addNewDiscountModal" class="edit " data-toggle="modal"><i class="material-icons control_point add" data-toggle="tooltip" title="新增優惠券">&#xe3ba;</i></a>
                            </div>
                        </div>
                    </div>
                    <table id="dataTable" class="table table-striped table-hover">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>

                                        <th>編號</th>
                                        <th>優惠券名稱</th>
                                        <th>折扣碼</th>
                                        <th>折扣金額</th>
                                        <th>開始日期</th>
                                        <th>結束日期</th>
                                        <th>編輯</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>

                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("Name") %></td>
                                        <td><%# Eval("Code") %></td>
                                        <td><%# Eval("Price") %></td>
                                        <td><%# Eval("BeginDate") %></td>
                                        <td><%# Eval("EndDate") %></td>
                                        <td>

                                            <a href="#editEmployeeModal" class="edit" data-toggle="modal" onclick='aa(<%#Eval("Id") %>)'><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
                                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" onclick='aa(<%#Eval("Id") %>)'><i class="material-icons" data-toggle="tooltip" data-original-title="刪除">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>


        <%-- Add Modal HTML --%>
        <div id="addNewDiscountModal" class="modal fade">
            <i class="material-icons control_point" aria-hidden="true"></i>
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div>
                        <div class="modal-header ">
                            <h3 class="modal-title menu-title"><strong onclick="_addDiscount()">新增優惠券</strong></h3>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body menu-title ">

                            <div class="form-group">

                                <div class="form-group">
                                    <label>優惠券名稱</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>折扣碼</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>折扣金額</label>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>開始日期</label>
                                    <div class="datetest">
                                        <p class="datag">
                                            <asp:TextBox ID="datepicker" CssClass="form-control" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>結束日期</label>
                                    <div class="datetest">
                                        <p class="datag">
                                            <asp:TextBox ID="datepicker2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="儲存" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" Text="取消" OnClick="Button2_Click" />
                        </div>
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
                            <h3 class="modal-title menu-title"><strong onclick="_editDiscount()">修改優惠券</strong></h3>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body menu-title ">

                            <div class="form-group">
                                <label>編號</label>
                                <input id="Text1" class="form-control" disabled="disabled" runat="server" />
                                <br />
                                <div class="form-group">
                                    <label>優惠券名稱</label>
                                    <input id="Text2" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>折扣碼</label>
                                    <input id="Text3" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>折扣金額</label>
                                    <input id="Text4" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>開始日期</label>
                                    <asp:TextBox ID="datepicker3" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>結束日期</label>
                                    <asp:TextBox ID="datepicker4" CssClass="form-control" runat="server"></asp:TextBox>
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
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div>
                        <div class="modal-header ">
                            <h3 class="modal-title menu-title"><strong>刪除優惠券</strong></h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <h4 class="menu-title">確定要刪除優惠券嗎?</h4>
                            <br />
                            <p class="text-warning"><small>刪除後將無法回復</small></p>
                            <input id="Hidden1" type="hidden" />
                        </div>
                        <div class="modal-footer menu-title">
                            <input type="button" id="delete1" class="btn btn-info" value="刪除">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="Server">

    <script>
        $(() => {

            $("#dataTable").DataTable();


        });
        function aa(id) {

            $.ajax({

                type: 'POST',
                url: "WebService.asmx/GetDiscount",
                async: false,
                contentType: "application/json;utd-8",
                dataType: "json",
                data: JSON.stringify({ "id": id }),
                success: function (result) {

                    $("#ContentPlaceHolder1_Text1").val(result.d.Id);
                    $("#ContentPlaceHolder1_Text2").val(result.d.Name);
                    $("#ContentPlaceHolder1_Text3").val(result.d.Code);
                    $("#ContentPlaceHolder1_Text4").val(result.d.Price);
                    $("#ContentPlaceHolder1_datepicker").val(result.d.BeginDate);
                    $("#ContentPlaceHolder1_datepicker2").val(result.d.EndDate);

                }
            });
            $("#save").click(function () {

                var mydata = {

                    id: $("#ContentPlaceHolder1_Text1").val(),
                    name: $("#ContentPlaceHolder1_Text2").val(),
                    code: $("#ContentPlaceHolder1_Text3").val(),
                    price: $("#ContentPlaceHolder1_Text4").val(),
                    beginDate: $("#ContentPlaceHolder1_datepicker3").val(),
                    endDate: $("#ContentPlaceHolder1_datepicker4").val()

                };

                $.ajax({

                    type: 'POST',
                    url: "WebService.asmx/DiscountUpdate",
                    async: false,
                    contentType: "application/json;utd-8",
                    dataType: "json",
                    data: JSON.stringify(mydata),
                    success: function (result) {

                        location.href = "Discount.aspx";
                    }
                })


            })

            $("#delete1").click(function () {

                var mydata = {

                    id: $("#ContentPlaceHolder1_Text1").val(),

                };
                $.ajax({

                    type: 'POST',
                    url: "WebService.asmx/DiscountDelete",
                    async: false,
                    contentType: "application/json;utd-8",
                    dataType: "json",
                    data: JSON.stringify(mydata),
                    success: function (result) {

                        location.href = "ADiscount.aspx";
                    }
                })


            })

        }

        $(function () {



            $("#ContentPlaceHolder1_datepicker2").datepicker({


                changeMonth: true,


                changeYear: true,


                showMonthAfterYear: true,
                yearRange: "1930:2030"
            });
            $("#ContentPlaceHolder1_datepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                showMonthAfterYear: true,
                yearRange: "1930:2030"
            });

            $("#ContentPlaceHolder1_datepicker3").datepicker({

                changeMonth: true,
                changeYear: true,
                showMonthAfterYear: true,
                yearRange: "1930:2030"
            });

            $("#ContentPlaceHolder1_datepicker4").datepicker({
                changeMonth: true,
                changeYear: true,
                showMonthAfterYear: true,
                yearRange: "1930:2030"
            });
        });
        $(function () {

            (function (factory) {

                if (typeof define === "function" && define.amd) {
                    define(["../widgets/datepicker"], factory);

                } else {
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
        function _addDiscount() {

            $("#ContentPlaceHolder1_TextBox1").val("慶祝小編結業");
            $("#ContentPlaceHolder1_TextBox2").val("Celebrate");
            $("#ContentPlaceHolder1_TextBox3").val("200");
            $("#ContentPlaceHolder1_datepicker").val("2021年12月23日");
            $("#ContentPlaceHolder1_datepicker2").val("2021年12月25日");
        }
        function _editDiscount() {

            $("#ContentPlaceHolder1_Text4").val("1500");
            $("#ContentPlaceHolder1_datepicker3").val("2021年12月23日");
            $("#ContentPlaceHolder1_datepicker4").val("2022年12月25日");
        }
    </script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
</asp:Content>

