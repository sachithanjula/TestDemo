
function loadInvoice(){


	fetch('assets/js/Invoice.json')
    .then(res => res.json())
    .then((out) => {
    	console.log('Output: ', out);
        document.getElementById("ac_number").innerHTML=out.Details.AccountNumber;
        document.getElementById("inv_number").innerHTML=out.Details.InvoiceNumber;
        document.getElementById("bill_date").innerHTML=out.Details.BillDate;
        document.getElementById("bill_prd").innerHTML=out.Details.BillPeriod;
        document.getElementById("due_date").innerHTML=out.Details.DueDate;
        document.getElementById("vat_number").innerHTML=out.Details.VATRegNo;

        var Address=out.Address;
        var addressArr = Address.split(',');
      
        document.getElementById("adress_ul").innerHTML="";
          for (var i = 0; i < addressArr.length; i++) { 

        	  document.getElementById("adress_ul").innerHTML=document.getElementById("adress_ul").innerHTML+"<li>"+ addressArr[i] +"</li>"; 
            
           } 

        document.getElementById("ot_charges").innerHTML=out.This_Month_Charges.OneTime_Charges.toFixed(2);
        document.getElementById("m_rental").innerHTML=out.This_Month_Charges.Monthly_Rental.toFixed(2);
        document.getElementById("usage_chrg").innerHTML=out.This_Month_Charges.Usage_Charges.toFixed(2);
        document.getElementById("dis_chrg").innerHTML=out.This_Month_Charges.Discount_Charges.toFixed(2);
        document.getElementById("taxes_levies").innerHTML=out.This_Month_Charges.Taxes.toFixed(2);
        document.getElementById("vat").innerHTML=out.This_Month_Charges.VAT.toFixed(2);

        document.getElementById("previous").innerHTML=out.Your_Account_Summery.Previous_Balance.toFixed(2);
        document.getElementById("payment").innerHTML=out.Your_Account_Summery.Payments.toFixed(2);
        document.getElementById("adjusmnt").innerHTML=out.Your_Account_Summery.Adjustments.toFixed(2);
        document.getElementById("arres").innerHTML=out.Your_Account_Summery.Arrears.toFixed(2);
        document.getElementById("this_month").innerHTML=out.Your_Account_Summery.ThisMonth_Charge.toFixed(2);
        document.getElementById("ammount_pay").innerHTML="<b>"+out.Your_Account_Summery.Amount_Payable.toFixed(2)+"</b>";

        document.getElementById("this_month_chrg").innerHTML="<b>"+out.ThisMonthCharge.toFixed(2)+"</b>";

        document.getElementById("one_time_chges").innerHTML=out.Charges_in_Details.OneTimeCharges_charges.toFixed(2);
        document.getElementById("one_time_disc").innerHTML=out.Charges_in_Details.OneTimeCharges_discount.toFixed(2);
        document.getElementById("one_time_net_total").innerHTML=out.Charges_in_Details.OneTimeCharges_net_Total.toFixed(2);
        document.getElementById("monthly_rental_chges").innerHTML=out.Charges_in_Details.MonthlyRentals_Charges.toFixed(2);
        document.getElementById("monthly_rental_disc").innerHTML=out.Charges_in_Details.MonthlyRentals_discount.toFixed(2);
        document.getElementById("monthly_rental_net_total").innerHTML=out.Charges_in_Details.MonthlyRentals_net_Total.toFixed(2);
        document.getElementById("usage").innerHTML="Usage- ("+out.Charges_in_Details.UsageDate+")";
        document.getElementById("call_chrg_chrges").innerHTML=out.Charges_in_Details.CallCharge_Charges.toFixed(2);
        document.getElementById("call_chrg_disc").innerHTML=out.Charges_in_Details.CallCharge_discount.toFixed(2);
        document.getElementById("value_add_sv_chrges").innerHTML=out.Charges_in_Details.ValueAddeService_Charges.toFixed(2);
        document.getElementById("value_add_sv_disc").innerHTML=out.Charges_in_Details.ValueAddedService_Discount.toFixed(2);
        document.getElementById("mobile_internet_useg_chrges").innerHTML=out.Charges_in_Details.MobileInternetUsage_Charges.toFixed(2);
        document.getElementById("mobile_internet_useg_disc").innerHTML=out.Charges_in_Details.MobileInternetUsage_Discount.toFixed(2);
        document.getElementById("roming_chrges").innerHTML=out.Charges_in_Details.Roaming_Charges.toFixed(2);
        document.getElementById("roming_disc").innerHTML=out.Charges_in_Details.Roaming_Discount.toFixed(2);
        document.getElementById("roming_net_total").innerHTML=out.Charges_in_Details.Roaming_Total.toFixed(2);


        document.getElementById("amount_taxes").innerHTML="<b>"+out.Taxes.toFixed(2)+"</b>";
        document.getElementById("total_month_chrges").innerHTML="<b>"+out.ThisMonthChargesRs.toFixed(2)+"</b>";
}).catch(err => console.error(err));





}
