<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseinfo.aspx.cs" Inherits="courseinfo" %>
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
        Session.Remove("loggedin");
        Response.Redirect("login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strconnect;
        strconnect = "Provider=microsoft.jet.oledb.4.0;";
        strconnect += "data source=" + MapPath(".\\tutorbookingsystem.mdb");
        strconnect += ";persist security info=false";
        System.Data.OleDb.OleDbConnection
        DBConnection = new System.Data.OleDb.OleDbConnection(strconnect);
        DBConnection.Open();
        System.Data.OleDb.OleDbCommand
        DBCommand = new OleDbCommand();
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = "INSERT INTO [course] ([coursetitle], [courselength]) VALUES ('" + coursetitle.Text + "','" + courselength.Text + "')";
        DBCommand.Connection = DBConnection;
        DBCommand.ExecuteNonQuery(); //for INSERT, DELETE, UPDATE, CREATE,..
        DBConnection.Close();
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
    <strong><h1>Course Information</h1></strong>
        <asp:Label ID="Label1" runat="server">Course Title</asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="coursetitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server">Course Length</asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="courselength" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="submit" OnClick="Button2_Click" Font-Bold="True" Font-Size="Medium" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="logout" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    </form>
    <br /><a href="editcourseinfo.aspx">Edit Course Information</a>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="bookappointment.aspx">Book Appointment</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
