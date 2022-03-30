<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Veripark.Web.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <table id="booklist" class="display" style="width: 100%">
                <thead>
                    <tr>
                        <th>Seç</th>
                        <th>Kitap başlığı</th>
                        <th>ISBN</th>
                        <th>Yayın yılı</th>
                        <th>Fiyatı</th>
                        <th>Teslim Alma/Teslim etme durumu</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="BookListId" runat="server" />
                </tbody>
                <tfoot>
                    <tr>
                        <th>Seç</th>
                        <th>Kitap başlığı</th>
                        <th>ISBN</th>
                        <th>Yayın yılı</th>
                        <th>Fiyatı</th>
                        <th>Teslim Alma/Teslim etme durumu</th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <hr class="mb-4 mt-4">
        <div class="row">
            <div class="col-6">
                <button class="btn btn-primary btn-lg btn-block" data-btn="checkout" onclick="CheckOut()">Teslim Et</button>
            </div>
            <div class="col-6">
                <button class="btn btn-primary btn-lg btn-block" data-btn="checkin" onclick="CheckIn()">Teslim Al</button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(document).ready(function () {
            $('#booklist').DataTable();
        });

        function statusControl(status) {
            if (status == bookStatus.WasDelivered) {
                document.querySelector('[data-btn="checkin"]').disabled = false;
                document.querySelector('[data-btn="checkout"]').disabled = true;
            }
            if (status == bookStatus.NotDelivered) {
                document.querySelector('[data-btn="checkout"]').disabled = false;
                document.querySelector('[data-btn="checkin"]').disabled = true;
            }
        }

        function CheckOut() {
            var control = selectedControl();
            if (control) {
                var kitapid = document.querySelector('#booklist input:checked').value;
                window.location = '/checkout?i=' + kitapid;
            }
        }

        function CheckIn() {
            var control = selectedControl();
            if (control) {
                var kitapid = document.querySelector('#booklist input:checked').value;
                window.location = '/checkin?i=' + kitapid;
            }
        }

        function selectedControl() {
            var selectedControl = document.querySelector('#booklist input:checked');
            if (selectedControl != null) {
                return true;
            }
            alert('Lütfen Bir Kitap Seçiniz.');
            return false;
        }

        var bookStatus = { NotDelivered: 0, WasDelivered: 1 };

    </script>
    <style>
        .dataTables_wrapper {
            width: 100% !important;
        }
    </style>
</asp:Content>
