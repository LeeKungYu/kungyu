<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <form runat="server">
        <br />

        <div class="col-lg-12">
            <%-- bootstrap-exrended.css  aa 3984 --%>
            <div class="card">
                <div class="card-title">
                    <h2 class="menu-title col-sm-4"><strong>詳細資料</strong></h2>
                </div>
                <div class="card-body">
                    <div class="horizontal-form-elements">
                        <div class="form-horizontal">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <label class="col-sm-2 control-label menu-title"><%--<font size="2">產品圖片:</font>--%></label>
                                        <div class="col-sm-10 productDetailimg ">
                                            <asp:Image CssClass="productDetailimg" ID="Image1" runat="server" />
                                            <asp:Image CssClass="productDetailimg" ID="Image2" runat="server" />
                                            <asp:Image CssClass="productDetailimg" ID="Image3" runat="server" />
                                            <%--<asp:Image ID="Image4" runat="server" />--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server" Text="返回" OnClick="Button2_Click" />
                                    </div>
                                </div>
                                <!-- /# column -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <%--<label class="col-sm-2 control-label menu-title"></label>--%>
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
    </form>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script>

</script>
</asp:Content>

