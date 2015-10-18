<%@ Page Language="C#" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="email" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<%@ import Namespace="System.Net.Mail" %>
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
    protected void send_Click(object sender, EventArgs e)
    {
        
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress(from.Text);
            mail.To.Add(to.Text);
            mail.Subject = subject.Text;
            mail.Body = message.Text;

            SmtpServer.Port = 465;//587;
            SmtpServer.Credentials = new System.Net.NetworkCredential(un.Text, password.Text);
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            alert.Text="mail Sent";
        }
        catch (Exception ex)
        {
            alert.Text=ex.ToString();
        }
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
        <h1><strong>Email Page</strong></h1>
        <asp:Label ID="Label1" runat="server" Text="From"></asp:Label>
        <asp:TextBox ID="from" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="To"></asp:Label>
        <asp:TextBox ID="to" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Subject"></asp:Label>
        <asp:TextBox ID="subject" runat="server" ></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="un" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="message"></asp:Label>
        <br />
        <asp:TextBox ID="message" runat="server" Height="251px"  Width="414px"></asp:TextBox>
        <br />
        <asp:Button ID="send" runat="server" OnClick="send_Click" Text="Send" Font-Bold="True" Font-Size="Medium" />
    
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="logout" Font-Bold="True" Font-Size="Medium" />
        <br />
    
        <asp:Label ID="alert" runat="server"></asp:Label>
    
    </form>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="courseinfo.aspx">Course Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
</body>
</html>
