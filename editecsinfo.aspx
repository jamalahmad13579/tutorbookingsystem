<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editecsinfo.aspx.cs" Inherits="editecsinfo" %>
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
        string editecs;
        editecs = "update [ecs] set [ecreason] = '" + ecreason.Text + "'";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = editecs;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        editecs = Label7.Text;
        DBCommand.ExecuteNonQuery();
        DBConnection.Close();
        Response.Redirect("ecsinfo.aspx");
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
    <asp:Label ID="Label1" runat="server" Text="Edit ECs Information"></asp:Label>
    
        <br />
        <br />
    
        <asp:Label ID="Label2" runat="server">ECReason</asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ecreason" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server">EC Incident Timespan</asp:Label>

    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="incidenttimespan" runat="server"></asp:TextBox>
        <br />
    <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
    <p>
        &nbsp;</p>
    </form>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="bookappointment.aspx">Book Appointment</a>
    <br /><a href="courseinfo.aspx">Course Infomration</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="tutorsinfo.aspx">Tutor Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
