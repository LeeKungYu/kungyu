<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDelete.aspx.cs" Inherits="DeleteProduct" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link href="dist/sweetalert.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <br />

        <div class="col-lg-12">
            <%-- bootstrap-exrended.css  aa 3984 --%>
            <div class="card">
                <div class="card-title">
                    <h2 class="menu-title col-sm-4"><strong>刪除產品</strong></h2>

                </div>
                <div class="card-body">
                    <div class="horizontal-form-elements">
                        <div class="form-horizontal">
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label menu-title"><font size="2"></font></label>
                                        <div class="col-sm-10">
                                            <%-- bootstrap.css 361 width:250px   --%>
                                            <asp:Image ID="Image1" CssClass="deleteImage" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-sm-4 control-label menu-title"><font size="2"></font></label>
                                        <div class="col-sm-10">
                                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"></label>
                                        <div class="col-sm-5">
                                            <%--<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" /> OnClientClick="return false"--%> 
                                            <asp:Button ID="button1" CssClass="btn btn-outline-primary" runat="server" Text="刪除" OnClick="Button1_Click"/>
                                            <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server" Text="返回" OnClick="Button2_Click" />

                                        </div>
                                    </div>

                                </div>
                                <!-- /# column -->

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品編號:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品名稱:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox2" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品類別:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox3" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">價錢:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox4" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">顏色:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox6" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">標籤:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox7" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <link href="Scripts/sweetalert2.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        //$(function () {
        //    //1.搭配MasterPage之後,伺服器控制項Render出來的標籤,id與name一定會被換掉,要拿被換掉的版本來寫Javascript
        //    $("#ContentPlaceHolder1_Button1").click(function () {
        //        swal({
        //            title: '確認刪除檔案?',
        //            text: "檔案即將被刪除!",
        //            type: 'warning',
        //            showCancelButton: true,
        //        }).then(
        //            function () {

        //                //2.搭配MasterPage之後,伺服器控制項Render出來的標籤,id與name會不一樣
        //                $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button1");

        //                $("#form1").submit();


        //            },
        //            function (dismiss) {
        //                if (dismiss === 'cancel') {
        //                    swal('取消', '檔案未被刪除', 'error')
        //                }
        //            });

        //    });

        //});
    </script>
</asp:Content>

