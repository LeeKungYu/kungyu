<%@ Page Language="C#" ValidateRequest="false" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = HiddenField1.Value;
        Response.Write(str);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.3/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.3/css/dx.light.css" />
    <link href="EditorCss/Style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    <script src="https://unpkg.com/devextreme-quill@1.5.5/dist/dx-quill.min.js"></script>
    <script src="https://cdn3.devexpress.com/jslib/21.2.3/js/dx.all.js"></script>
    <%--<script src="EditorCss/index.js"></script>--%>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="demo-container">
                <div class="html-editor" id="aa"></div>
                <div class="options">
                    <div class="caption">Options</div>
                    <div class="option">
                        <div id="multiline"></div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="setValue()" />
    </form>

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
            $("#HiddenField1").val(str);
        }

    </script>
</body>
</html>
