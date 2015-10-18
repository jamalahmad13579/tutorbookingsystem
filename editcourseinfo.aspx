<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editcourseinfo.aspx.cs" Inherits="editcourseinfo" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["loggedin"] == null)
            {
                Session.Remove("loggedin");
                Response.Redirect("login.aspx");

            }

        }
        catch (InvalidCastException)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strconnect;
        strconnect = "Provider=microsoft.jet.oledb.4.0;";
        strconnect += "data source=" + MapPath(".\\tutorbookingsystem.mdb");
        strconnect += ";persist security info=false";
        System.Data.OleDb.OleDbConnection
        DBConnection = new System.Data.OleDb.OleDbConnection(strconnect);
        System.Data.OleDb.OleDbCommand
        DBCommand = new OleDbCommand();
        string un;
        un = (string)Session["loggedin"];
        string editcourse;
        editcourse = "update [course] set [coursetitle] = '" + coursetitle.Text + "'";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = editcourse;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        editcourse = Label7.Text;
        DBCommand.ExecuteNonQuery();
        DBConnection.Close();
        Response.Redirect("courseinfo.aspx");
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>tutorbookingsystem</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
    </div>
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Editing Course Information"></asp:Label>
    
        <br />
        <br />
    
    <asp:Label ID="Label2" runat="server">Course Title</asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="coursetitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server">Course Length</asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="courselength" runat="server"></asp:TextBox>
        <br />
        <br />
    <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
    <p>
        &nbsp;</p>
    </form>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="bookappointment.aspx">Book Appointment</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
