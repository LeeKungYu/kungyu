<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductAdd.aspx.cs" Inherits="ProductAdd" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link rel="stylesheet" href="/path/to/cdn/bootstrap.min.css" />
    <link href="theme-assets/css/bootstrap-extended.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form runat="server">
        <br />

        <div class="col-lg-12">
            <%-- bootstrap-exrended.css  aa 3984 --%>
            <div class="card">
                <div class="card-title">
                    <h2 class="menu-title col-sm-4"><strong onclick="_addProduct()">新增產品</strong></h2>

                </div>
                <div class="card-body">
                    <div class="horizontal-form-elements">
                        <div class="form-horizontal">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品名稱:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <%--<input type="text" class="form-control" value="Some text value...">--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品類別:</font></label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">請選擇</asp:ListItem>
                                                <asp:ListItem Value="1">喵嗚的床</asp:ListItem>
                                                <asp:ListItem Value="2">紓壓小物</asp:ListItem>
                                                <asp:ListItem Value="3">外出用品</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">價錢:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">庫存:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title "><font size="2">顏色:</font></label>
                                        <div class="col-sm-10">
                                            <asp:CheckBoxList ID="CheckBoxList1" CssClass="form-control edit-checkbox" runat="server" RepeatColumns="6" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="Red"></asp:ListItem>
                                                <asp:ListItem Value="Blue"></asp:ListItem>
                                                <asp:ListItem Value="Gray"></asp:ListItem>
                                                <asp:ListItem Value="Plink"></asp:ListItem>
                                                <asp:ListItem Value="White"></asp:ListItem>
                                                <asp:ListItem Value="Green"></asp:ListItem>
                                                <asp:ListItem Value="Black"></asp:ListItem>
                                                <asp:ListItem Value="Brown"></asp:ListItem>
                                                <asp:ListItem Value="Yellow"></asp:ListItem>
                                                <asp:ListItem Value="Purple"></asp:ListItem>
                                                <asp:ListItem Value="Orange"></asp:ListItem>
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">標籤:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <!-- /# column -->
                                <div class="col-lg-6">
                                    <div class="form-group ">
                                        <label class="col-sm-4 control-label menu-title"><font size="2">詳細資料:</font></label>
                                        <div class="demo-container">
                                            <div class="html-editor" id="aa">
                                            </div>
                                        </div>
                                    </div>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label menu-title"><font size="2">上傳主圖:</font></label>

                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                        <%--<asp:FileUpload ID="FileUpload2" runat="server" />--%>
                                    </div>

                                    <div class="form-group product_Add">
                                        <label class="col-sm-2 control-label menu-title"></label>
                                        <div class="col-sm-5">
                                            <asp:Button ID="Button1" CssClass="btn btn-outline-primary" runat="server" Text="儲存" OnClick="Button1_Click" OnClientClick="setValue()" />
                                            <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server" Text="返回" OnClick="Button2_Click" />


                                        </div>
                                    </div>

                                </div>
                                <!-- /# column -->
                            </div>
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

        const editor = $('.html-editor').dxHtmlEditor({
            height: 300,
            weight: 200,

            toolbar: {
                items: [
                    'undo', 'redo', 'separator',
                    {
                        name: 'size',
                        acceptedValues: ['8pt', '10pt', '12pt', '14pt', '18pt', '24pt', '36pt'],
                    },
                    {
                        name: 'font',
                        acceptedValues: ['Arial', 'Courier New', 'Georgia', 'Impact', 'Lucida Console', 'Tahoma', 'Times New Roman', 'Verdana'],
                    },
                    'separator', 'bold', 'italic', 'strike', 'underline', 'separator',
                    'alignLeft', 'alignCenter', 'alignRight', 'alignJustify', 'separator',
                    'orderedList', 'bulletList', 'separator',
                    {
                        name: 'header',
                        acceptedValues: [false, 1, 2, 3, 4, 5],
                    }, 'separator',
                    'color', 'background', 'separator',
                    'link', 'image', 'separator',
                    'clear', 'codeBlock', 'blockquote', 'separator',
                    'insertTable', 'deleteTable',
                    'insertRowAbove', 'insertRowBelow', 'deleteRow',
                    'insertColumnLeft', 'insertColumnRight', 'deleteColumn',
                ],
            },
            mediaResizing: {
                enabled: true,
            },
        }).dxHtmlEditor('instance');

        function setValue() {
            var str = editor.option("value");;
            //console.log(a);

            $("#ContentPlaceHolder1_HiddenField1").val(str);


        }
        function _addProduct() {
            $("#ContentPlaceHolder1_TextBox1").val("樂樂藤編貓窩");
            $("#ContentPlaceHolder1_DropDownList1").val("2");
            $("#ContentPlaceHolder1_TextBox2").val("1690");
            $("#ContentPlaceHolder1_TextBox3").val("20");
            $("#ContentPlaceHolder1_CheckBoxList1").val("ContentPlaceHolder1_CheckBoxList1_4", "ContentPlaceHolder1_CheckBoxList1_10");
            $("#ContentPlaceHolder1_TextBox4").val("橘色,水果");
            //$("#ContentPlaceHolder1_TextBox1").val("樂樂藤編貓窩"); 詳細資料
            //$("#ContentPlaceHolder1_TextBox1").val("樂樂藤編貓窩"); 上傳主圖


        }
    </script>

</asp:Content>

