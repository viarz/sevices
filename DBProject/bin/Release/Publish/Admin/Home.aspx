<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Service.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DBProject.Home" %>








<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
          
    <form runat ="server">

        


        <br />
     


    <div style="margin:20%">

        <h2><strong style="margin:20%">Service Information</strong></h2>

        <asp:gridview ID="service_View" runat="server" CellPadding="4" ForeColor="Black" Height="50px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:gridview>


        </div>




       

        </form>
</asp:Content>
