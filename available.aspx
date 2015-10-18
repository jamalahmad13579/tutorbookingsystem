<%@ Page Language="C#" AutoEventWireup="true" CodeFile="available.aspx.cs" Inherits="available" %>
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedin");
        Response.Redirect("login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
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
        DBCommand.CommandText = "INSERT INTO [availability] ([username],[availabledate],[starttime],[endtime]) VALUES ('" + username.Text + "','" + avd.SelectedDate.ToString() + "','" + DateTime.Parse(starttime.Text).TimeOfDay + "', '" + DateTime.Parse(endtime.Text).TimeOfDay + "')";
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
        <strong><h1>Available Page</h1></strong>
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Available"></asp:Label>
        <br />
        <asp:Calendar ID="avd" runat="server"></asp:Calendar>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Start Time"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="starttime" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="End Time"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="endtime" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="submit" Font-Bold="True" Font-Size="Medium" />
    
        <br />
        <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Size="Medium" Text="logout" OnClick="Button2_Click" />
    
    </form>
        <br /><a href="editavailable.aspx">Edit Available Page</a>
        <br /><a href="index.aspx">Home Page</a>
        <br /><a href="courseinfo.aspx">Course Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
