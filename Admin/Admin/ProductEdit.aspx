<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" Debug="true"  validateRequest="False"  AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="ProductEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <br />

        <div class="col-lg-12">
            <div class="card ">
                <div class="card-title">
                    <h2 class="menu-title col-sm-4"><strong>修改產品</strong></h2>

                </div>
                <div class="card-body ">
                    <div class="horizontal-form-elements">
                        <div class="form-horizontal">
                            <div class="row ">
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
                                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">產品類別:</font></label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="請選擇"></asp:ListItem>
                                                <asp:ListItem Value="喵嗚的床"></asp:ListItem>
                                                <asp:ListItem Value="紓壓小物"></asp:ListItem>
                                                <asp:ListItem Value="外出用品"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">價錢:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">庫存:</font></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"><font size="2">顏色:&nbsp;&nbsp;</font></label>
                                        <div class="col-sm-10">
                                            <asp:Label ID="Label1" CssClass="menu-title font-medium-5" runat="server" Text="Label"></asp:Label>
                                            <br />
                                            <br />
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
                                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>

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
                                        <label class="col-sm-4 control-label menu-title"><font size="2">上傳圖片:</font></label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <%--<asp:FileUpload ID="FileUpload2" runat="server" />--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label menu-title"></label>
                                        <div class="col-sm-5 ">

                                            <asp:Button ID="Button1" CssClass="btn btn-outline-primary " runat="server" Text="儲存" OnClick="Button1_Click" OnClientClick="setValue()"/>
                                            <asp:Button ID="Button2" CssClass="btn btn-outline-primary " runat="server" Text="返回" OnClick="Button2_Click" />

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
      </script>
</asp:Content>
