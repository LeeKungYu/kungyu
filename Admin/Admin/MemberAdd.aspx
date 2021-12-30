<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberAdd.aspx.cs" Inherits="MemberList" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link href="Scripts/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <form runat="server">
        <br />

        <div class="col-lg-12">
            <div class="card">
                <div class="add-member">
                    <h2 class="menu-title"><strong onclick="_addMember()">新增會員</strong></h2>
                </div>

                <div class="card-body">
                    <div class="horizontal-form-elements">
                        <div class="form-horizontal">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">會員姓名:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">密碼:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">Email:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">連絡電話:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">聯絡地址:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                </div>
                                <!-- /# column -->
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label menu-title"><font size="2">會員加入日期:</font></label>
                                        <div class="col-sm-10">
                                            <div class="datetest">
                                                <p class="datag">
                                                    <asp:TextBox ID="datepicker" CssClass="form-control" runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label menu-title"><font size="2">是否接受最新資訊:</font></label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="請選擇"></asp:ListItem>
                                                <asp:ListItem Value="1">是</asp:ListItem>
                                                <asp:ListItem Value="0">否</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">性別:</font></label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="1">男性</asp:ListItem>
                                                <asp:ListItem Value="2">女性</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">會員生日:</font></label>
                                        <div class="col-sm-10">
                                            <div class="datetest">
                                                <p class="datag">
                                                    <asp:TextBox ID="datepicker2" CssClass="form-control" runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title "><font size="2">備註:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-sm-10">
                                        <div class="form-group">
                                            <div class="position-absolute top-0 end-0">
                                                <asp:Button ID="Button1" CssClass="btn btn-outline-primary" runat="server" Text="儲存" OnClick="Button1_Click" />
                                                <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server" Text="返回" OnClick="Button2_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- /# column -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /# card -->


        </div>

    </form>



    <script>
        //$(function () {

        //    $("#ContentPlaceHolder1_Button3").click(function () {
        //        swal({
        //            title: '完成',
        //            text: "檔案新增成功!",
        //            type: 'success',
        //        });
        //    });
        //})


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
            $("#ContentPlaceHolder1_datepicker2").datepicker({

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

                    dateFormat: "yy-mm-dd",

                    firstDay: 1,

                    isRTL: false,

                    showMonthAfterYear: true,

                    yearSuffix: "年"
                };

                datepicker.setDefaults(datepicker.regional["zh-TW"]);

                return datepicker.regional["zh-TW"];

            }));
        });
        function _addMember() {
            $("#ContentPlaceHolder1_TextBox1").val("兵拿鐵");
            $("#ContentPlaceHolder1_TextBox2").val("123");
            $("#ContentPlaceHolder1_TextBox3").val("latte@gmail.com");
            $("#ContentPlaceHolder1_TextBox4").val("0977777587");
            $("#ContentPlaceHolder1_TextBox5").val("星巴克");
            $("#ContentPlaceHolder1_datepicker").val("2021-12-24");
            $("#ContentPlaceHolder1_DropDownList2").val("0");
            $("#ContentPlaceHolder1_DropDownList1").val("1");
            $("#ContentPlaceHolder1_datepicker2").val("2021-11-18");
            $("#ContentPlaceHolder1_TextBox8").val("冰塊三顆");
            





        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</asp:Content>

