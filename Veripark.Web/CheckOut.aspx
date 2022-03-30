<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Veripark.Web.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-12">
            <h4 class="mb-3">Teslim Edilen Kişi Bilgileri</h4>
            <div class="needs-validation" novalidate="">
                <div class="row">
                    <div class="col-12">
                        <label for="firstName">İsim Soyisim</label>
                        <input type="text" class="form-control" name="namesurname" placeholder="" value="" required="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label for="firstName">Telefon</label>
                        <input type="text" class="form-control" name="phonenumber" placeholder="xx-xxx xxx xxxx" value="" required="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label for="firstName">TC Numarası</label>
                        <input type="text" class="form-control" name="identifynumber" maxlength="11" placeholder="" value="" required="">
                    </div>
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" onclick="CheckOut()">Teslim Et</button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="/CustomJs/jquery.mask.js"></script>
    <script>
        $(document).ready(function () {
            $("[name='phonenumber']").mask("99-999 999 9999", { clearIfNotMatch: false });
            $("[name='identifynumber']").mask("99999999999", { clearIfNotMatch: false });
        });
        function CheckOut() {
            var namesurname = document.querySelector('[name="namesurname"]')
            var phonenumber = document.querySelector('[name="phonenumber"]')
            var identifynumber = document.querySelector('[name="identifynumber"]')
            if (namesurname.value == "") {
                alert('Lütfen İsim Giriniz');
                return;
            }
            if (phonenumber.value == "") {
                alert('Lütfen Telefon Numarası Giriniz')
                return;
            }
            if (identifynumber.value == "" && identifynumber.maxLength == 11 && !checkTcNum(identifynumber.value)) {
                alert('Lütfen Geçerli Kimlik Numarası Giriniz')
                return;
            }

            $.ajax({
                type: "POST",
                url: "/CheckOut.aspx/Save",
                data: JSON.stringify({ bookId: getQueryName('i'), namesurname: namesurname.value, phonenumber: phonenumber.value, identifynumber: identifynumber.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    window.location = "/";
                },
            });
        }

        //QueryStringdeki veriyi alır
        function getQueryName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, "+"));
        }
        // TC Kontrol Algoritması
        var checkTcNum = function (value) {
            var tcKimlikNo = value;

            if ((tcKimlikNo == null) || (tcKimlikNo.length == 0))
                return false;
            var tcKimlikNoNumber = parseInt(tcKimlikNo);

            var d = new Array(10);
            var tmp1 = null;
            var tmp = null;
            var odd_sum = null;
            var even_sum = null;
            var total = null;
            var chkDigit1 = null;
            var chkDigit2 = null;
            if (tcKimlikNo.length != 11)
                return false;
            if (tcKimlikNoNumber > 0) {
                tmp = Math.floor(tcKimlikNoNumber / 100);
                tmp1 = Math.floor(tcKimlikNoNumber / 100);
                for (var i = 9; i > 0; i--) {
                    d[i] = tmp1 % 10;
                    tmp1 = Math.floor(tmp1 / 10);
                }
                odd_sum = d[9] + d[7] + d[5] + d[3] + d[1];
                even_sum = d[8] + d[6] + d[4] + d[2];
                total = odd_sum * 3 + even_sum;
                chkDigit1 = (10 - (total % 10)) % 10;
                odd_sum = chkDigit1 + d[8] + d[6] + d[4] + d[2];
                even_sum = d[9] + d[7] + d[5] + d[3] + d[1];
                total = odd_sum * 3 + even_sum;
                chkDigit2 = (10 - (total % 10)) % 10;
                tmp = tmp * 100 + chkDigit1 * 10 + chkDigit2;
                if (tmp != tcKimlikNoNumber)
                    return false;
            }
            else
                return false;
            return true;
        };
    </script>
</asp:Content>
