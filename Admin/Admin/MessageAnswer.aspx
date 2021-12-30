<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MessageAnswer.aspx.cs" Inherits="MessageAnswer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <br />

        <div class="col-lg-12">
            <%-- bootstrap-exrended.css  aa 3984 --%>
            <div class="card">
                <div class="form-body">
                    <h4 class="form-section menu-title"><i class="ft-clipboard "></i>
                        <stong>會員留言</stong></h4>
                    <div class="form-group row">
                        <div class="card-body">
                            <div class="horizontal-form-elements">
                                <div class="form-horizontal">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form form-horizontal">
                                                <div class="form-body">

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput5">會員編號</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput5">會員姓名</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput5">主旨</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput5">留言日期</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput9">留言內容</label>
                                                        <div class="col-md-9">
                                                            <%--<asp:Label ID="Label1" TextMode="MultiLine" Rows="6" CssClass="form-control" runat="server" Text="Label"></asp:Label>--%>
                                                            <asp:TextBox ID="TextBox5" TextMode="MultiLine" Rows="6" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="projectinput5">圖片</label>
                                                        <div class="col-md-9">
                                                            <asp:Image ID="Image1" runat="server" />
                                                            <asp:Label ID="Label1" CssClass="menu-title red" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <!-- /# column -->
                                        <div class="col-lg-6">
                                            <div class="form form-horizontal">
                                                <div class="form-body">
                                                    <div class="form-group row">
                                                        <%--<label class="col-md-3 label-control" for="timesheetinput7">回覆</label>--%>
                                                        <div class="col-md-12">
                                                            <div class="_msg">
                                                                <label class="label-control" for="timesheetinput7">回覆</label>
                                                                <hr />

                                                                <asp:Label ID="Label2" runat="server" CssClass="menu-title black " Text=""></asp:Label>

                                                            </div>
                                                            <br />
                                                            <br />

                                                            <div class="position-relative has-icon-left">
                                                                <div class="demo-container">
                                                                    <div class="html-editor" id="aa">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    </div>
                                                </div>

                                                <div class="form-actions right">
                                                    <asp:Button ID="Button1" CssClass="btn btn-danger mr-1" runat="server" Text="儲存" OnClick="Button1_Click" OnClientClick="setValue()" />
                                                    <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="返回" OnClick="Button2_Click" />

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
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="Server">
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

