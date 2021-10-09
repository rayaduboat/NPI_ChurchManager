using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for FinanceAggregation
/// </summary>
public class FinanceAggregation
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static DistrictDBEntities db = new DistrictDBEntities();
    public FinanceAggregation()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public IQueryable<AccountsContribution> AccountsContribution(string branchName, string fromdate, string todate)
    {
        IQueryable<AccountsContribution> message = null;

        Func<string, int> GetBranchID = (a) => { return db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault(); };
        try
        {
            if (branchName == "All")
            {


                Func<decimal, decimal, decimal> percentageconvert = (account, total) => { return decimal.Round(account / total, 2) * 100; };
                //check what branch has been specified
                var income = db.Finances.Where(i => i.AccountType == "Income").Sum(i => i.Amount);
                var asset = db.Finances.Where(i => i.AccountType == "Assets").Sum(i => i.Amount);
                var expenditure = db.Finances.Where(i => i.AccountType == "Expenditure").Sum(i => i.Amount);
                var liability = db.Finances.Where(i => i.AccountType == "Liability").Sum(i => i.Amount);
                var transaction = 0;// db.BankTransactions.Sum(i => i.Amount);
                var totalaccount = income + asset + expenditure + liability + transaction;
                List<AccountsContribution> items = new List<global::AccountsContribution>();
                items.Add(new global::AccountsContribution()
                {
                    BranchName = branchName == "All" ? "All Branches" : branchName,
                    Income = income,
                    Assets = asset,
                    Expenditure = expenditure,
                    Liability = liability,
                    Transaction = transaction,
                    //PercentageIncome         =percentageconvert(income       ,totalaccount), 
                    PercentageAssets = percentageconvert(asset, income),
                    PercentageExpenditure = percentageconvert(expenditure, income),
                    PercentageLiability = percentageconvert(liability, income),
                    PercentageTransaction = percentageconvert(transaction, income),
                });
                message = items.AsQueryable();
            }
            else
            {
                Func<decimal, decimal, decimal> percentageconvert = (account, total) => { return decimal.Round(account / total, 2) * 100; };
                //check what branch has been specified
                int branchID = GetBranchID(branchName);
                var income = db.Finances.Where(i => i.AccountType == "Income" && i.BranchID == branchID).Sum(i => i.Amount);
                var asset = db.Finances.Where(i => i.AccountType == "Assets" && i.BranchID == branchID).Sum(i => i.Amount);
                var expenditure = db.Finances.Where(i => i.AccountType == "Expenditure" && i.BranchID == branchID).Sum(i => i.Amount);
                var liability = db.Finances.Where(i => i.AccountType == "Liability" && i.BranchID == branchID).Sum(i => i.Amount);
                var transaction = 0;// db.BankTransactions.Sum(i => i.Amount);
                var totalaccount = income + asset + expenditure + liability + transaction;
                List<AccountsContribution> items = new List<global::AccountsContribution>();
                items.Add(new global::AccountsContribution()
                {
                    BranchName = branchName == "All" ? "All Branches" : branchName,
                    Income = income,
                    Assets = asset,
                    Expenditure = expenditure,
                    Liability = liability,
                    Transaction = transaction,
                    //PercentageIncome         =percentageconvert(income       ,totalaccount), 
                    PercentageAssets = percentageconvert(asset, income),
                    PercentageExpenditure = percentageconvert(expenditure, income),
                    PercentageLiability = percentageconvert(liability, income),
                    PercentageTransaction = percentageconvert(transaction, income),
                });
                message = items.AsQueryable();
            }
        }
        catch (Exception ex)
        {

            //throw;
        }

        return message;
    }
    public object PercentagaAccountsContribution(string branchName, string fromdate, string todate)
    {
        string message = "Accounts calculation failed";

        Func<string, int> GetBranchID = (a) => { return db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault(); };
        try
        {
            //check what branch has been specified
            switch (branchName)
            {
                case "All":
                    message = sz.Serialize(from match in db.Finances
                                           where Convert.ToDateTime(match.Date) >= Convert.ToDateTime(fromdate)
                                           where Convert.ToDateTime(match.Date) <= Convert.ToDateTime(todate)
                                           group match by match.BranchID into newGroup
                                           select new AccountsContribution
                                           {
                                               Income = newGroup.Where(i => i.AccountType == "Income").Sum(i => i.Amount),
                                               Expenditure = newGroup.Where(i => i.AccountType == "Expenditure").Sum(i => i.Amount),
                                               Assets = newGroup.Where(i => i.AccountType == "Assets").Sum(i => i.Amount),
                                               Liability = newGroup.Where(i => i.AccountType == "Liability").Sum(i => i.Amount),
                                               Transaction = newGroup.Where(i => i.AccountType == "Transaction").Sum(i => i.Amount),
                                               Total = newGroup.Where(i => i.AccountType == "Income").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Expenditure").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Assets").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Liability").Sum(i => i.Amount)
                                               //      + newGroup.Where(i => i.AccountType == "Transaction").Sum(i => i.Amount)
                                           });
                    break;
                default:
                    message = sz.Serialize(from match in db.Finances
                                           where Convert.ToDateTime(match.Date) >= Convert.ToDateTime(fromdate)
                                           where Convert.ToDateTime(match.Date) <= Convert.ToDateTime(todate)
                                           where match.BranchID == GetBranchID(branchName)
                                           group match by match.BranchID into newGroup
                                           select new AccountsContribution
                                           {
                                               Income = newGroup.Where(i => i.AccountType == "Income").Sum(i => i.Amount),
                                               Expenditure = newGroup.Where(i => i.AccountType == "Expenditure").Sum(i => i.Amount),
                                               Assets = newGroup.Where(i => i.AccountType == "Assets").Sum(i => i.Amount),
                                               Liability = newGroup.Where(i => i.AccountType == "Liability").Sum(i => i.Amount),
                                               Transaction = newGroup.Where(i => i.AccountType == "Transaction").Sum(i => i.Amount),
                                               Total = newGroup.Where(i => i.AccountType == "Income").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Expenditure").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Assets").Sum(i => i.Amount)
                                                      + newGroup.Where(i => i.AccountType == "Liability").Sum(i => i.Amount)
                                               //              + newGroup.Where(i => i.AccountType == "Transaction").Sum(i => i.Amount)
                                           });
                    break;
            }

        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    public string AccountName(string branchName, string fromdate, string todate)
    {
        string message = null;
        try
        {
            //var query = from my in ((from match in db.Finances
            //                         join brn in db.Branches on match.BranchID equals brn.ID
            //                         group match by new { incomeName = match.Name, branchid = brn.Name } into newGroup
            //                         select new
            //                         {
            //                             branchName = newGroup.Key.branchid,
            //                             incomeName = newGroup.Key.incomeName,
            //                             Amount = (decimal?)newGroup.Sum(p => p.Amount) ?? 0,

            //                         }).AsEnumerable().DefaultIfEmpty())

            //            group my by my.branchName into newsubgroup
            //            select new
            //            {
            //                BranchName = newsubgroup.Key,
            //                breakdown = newsubgroup
            //            };


            Func<string, int> mydate = (d) => {
                string ddd = Convert.ToString(d);
                string yyyy = ddd.Substring(6, 4);
                string mm =   ddd.Substring(3, 2);
                string dd =   ddd.Substring(0, 2);
               // DateTime format = DateTime.ParseExact(ddd,"yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);
                return  int.Parse(yyyy+mm+dd);
            };
            //List<string> dates = db.Finances.AsEnumerable().Select(i => mydate(i.Date.Replace("/",""))).ToList();
            int FromDate = mydate(fromdate);
            int ToDate   = mydate(todate);

             int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            var query = (

                       new
                       {
                           income = db.Finances.AsEnumerable()
                                     .Where(i => i.AccountType == "Income")
                                     .Where(i => i.Date >= FromDate)
                                     .Where(i => i.Date <= ToDate)
                                     .GroupBy(i => i.Name).
                                      Select(i => new AccountsName()
                        {
                            Name = i.Key,
                            Total = i.Sum(p => p.Amount),
                            Branch1015     = (decimal?)i.Where(p => p.BranchID == 1015).Sum(p => p.Amount) ?? 0,
                            Branch1016     = (decimal?)i.Where(p => p.BranchID == 1016).Sum(p => p.Amount) ?? 0,
                            Branch1017     = (decimal?)i.Where(p => p.BranchID == 1017).Sum(p => p.Amount) ?? 0,
                            Branch1018     = (decimal?)i.Where(p => p.BranchID == 1018).Sum(p => p.Amount) ?? 0,
                            Branch1019     = (decimal?)i.Where(p => p.BranchID == 1019).Sum(p => p.Amount) ?? 0,
                            Branch1020     = (decimal?)i.Where(p => p.BranchID == 1020).Sum(p => p.Amount) ?? 0,
                            Branch1021     = (decimal?)i.Where(p => p.BranchID == 1021).Sum(p => p.Amount) ?? 0,
                            Branch1022     = (decimal?)i.Where(p => p.BranchID == 1022).Sum(p => p.Amount) ?? 0,
                            Branch1023     = (decimal?)i.Where(p => p.BranchID == 1023).Sum(p => p.Amount) ?? 0,
                            Branch1024     = (decimal?)i.Where(p => p.BranchID == 1024).Sum(p => p.Amount) ?? 0,
                            Branch1025     = (decimal?)i.Where(p => p.BranchID == 1025).Sum(p => p.Amount) ?? 0,
                            Branch1026     = (decimal?)i.Where(p => p.BranchID == 1026).Sum(p => p.Amount) ?? 0,
                            Branch1027     = (decimal?)i.Where(p => p.BranchID == 1027).Sum(p => p.Amount) ?? 0,
                            Branch1028     = (decimal?)i.Where(p => p.BranchID == 1028).Sum(p => p.Amount) ?? 0,
                            Branch1029     = (decimal?)i.Where(p => p.BranchID == 1029).Sum(p => p.Amount) ?? 0,
                            Branch1030     = (decimal?)i.Where(p => p.BranchID == 1030).Sum(p => p.Amount) ?? 0




                                      }),
                           expenditure = db.Finances.AsEnumerable()
                                     .Where(i => i.AccountType == "Expenditure")
                                     .Where(i => i.Date >= FromDate)
                                     .Where(i => i.Date <= ToDate)
                                     .GroupBy(i => i.Name).
                                      Select(i => new AccountsName()
                        {
                            Name = i.Key,
                            Total = i.Sum(p => p.Amount),

                            Branch1015 =   (decimal?)i.Where(p => p.BranchID == 1015).Sum(p => p.Amount) ?? 0,
                            Branch1016 =   (decimal?)i.Where(p => p.BranchID == 1016).Sum(p => p.Amount) ?? 0,
                            Branch1017 =   (decimal?)i.Where(p => p.BranchID == 1017).Sum(p => p.Amount) ?? 0,
                            Branch1018 =   (decimal?)i.Where(p => p.BranchID == 1018).Sum(p => p.Amount) ?? 0,
                            Branch1019 =   (decimal?)i.Where(p => p.BranchID == 1019).Sum(p => p.Amount) ?? 0,
                            Branch1020 =   (decimal?)i.Where(p => p.BranchID == 1020).Sum(p => p.Amount) ?? 0,
                            Branch1021 =   (decimal?)i.Where(p => p.BranchID == 1021).Sum(p => p.Amount) ?? 0,
                            Branch1022 =   (decimal?)i.Where(p => p.BranchID == 1022).Sum(p => p.Amount) ?? 0,
                            Branch1023 =   (decimal?)i.Where(p => p.BranchID == 1023).Sum(p => p.Amount) ?? 0,
                            Branch1024 =   (decimal?)i.Where(p => p.BranchID == 1024).Sum(p => p.Amount) ?? 0,
                            Branch1025 =   (decimal?)i.Where(p => p.BranchID == 1025).Sum(p => p.Amount) ?? 0,
                            Branch1026 =   (decimal?)i.Where(p => p.BranchID == 1026).Sum(p => p.Amount) ?? 0,
                            Branch1027 =   (decimal?)i.Where(p => p.BranchID == 1027).Sum(p => p.Amount) ?? 0,
                            Branch1028 =   (decimal?)i.Where(p => p.BranchID == 1028).Sum(p => p.Amount) ?? 0,
                            Branch1029 =   (decimal?)i.Where(p => p.BranchID == 1029).Sum(p => p.Amount) ?? 0,
                            Branch1030 =   (decimal?)i.Where(p => p.BranchID == 1030).Sum(p => p.Amount) ?? 0
                                      }),
                           branchIncome = new
                           {
                               Branch1015 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1015 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1016 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1016 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1017 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1017 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1018 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1018 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1019 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1019 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1020 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1020 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1021 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1021 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1022 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1022 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1023 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1023 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1024 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1024 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1025 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1025 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1026 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1026 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1027 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1027 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1028 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1028 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1029 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1029 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,
                               Branch1030 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1030 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0,



                               Total = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i =>  i.AccountType == "Income").Sum(i => i.Amount) ?? 0,

                           },
                           branchExpenditure = new
                           {
                               Branch1015 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1015 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1016 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1016 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1017 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1017 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1018 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1018 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1019 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1019 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1020 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1020 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1021 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1021 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1022 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1022 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1023 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1023 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1024 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1024 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1025 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1025 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1026 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1026 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1027 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1027 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1028 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1028 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1029 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1029 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,
                               Branch1030 = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1030 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,



                               Total = (decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i =>  i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0,


                           },
                           deficitOrSurplus=new  {
                               Branch1015 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1015 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1015 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1016 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1016 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1016 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1017 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1017 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1017 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1018 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1018 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1018 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1019 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1019 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1019 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1020 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1020 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1020 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1021 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1021 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1021 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1022 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1022 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1022 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1023 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1023 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1023 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1024 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1024 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0)-  ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1024 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1025 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1025 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1025 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1026 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1026 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1026 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1027 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1027 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1027 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1028 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1028 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1028 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1029 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1029 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1029 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                               Branch1030 = ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1030 && i.AccountType == "Income").Sum(i => i.Amount) ?? 0) - ((decimal?)db.Finances.AsEnumerable().Where(i => i.Date >= FromDate).Where(i => i.Date <= ToDate).Where(i => i.BranchID == 1030 && i.AccountType == "Expenditure").Sum(i => i.Amount) ?? 0),
                           },

                           Message = "Update successful",
                           Branches= db.Branches.OrderBy(i=>i.ID).Select(i=>i.Name)
                       }




                       );
            message = sz.Serialize(query);
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
}

public class AccountsContribution
{
    public decimal Income { get; set; }
    public decimal Expenditure { get; set; }
    public decimal Assets { get; set; }
    public decimal Liability { get; set; }
    public decimal Transaction { get; set; }
    public decimal Total { get; internal set; }
    public string BranchName { get; internal set; }
    public int BranchID { get; internal set; }
    public decimal PercentageIncome { get; internal set; }
    public decimal PercentageAssets { get; internal set; }
    public decimal PercentageExpenditure { get; internal set; }
    public decimal PercentageLiability { get; internal set; }
    public decimal PercentageTransaction { get; internal set; }
}

public class AccountsIncomeContribution
{
    public int BranchID { get; set; }
    public decimal Income { get; set; }
}

public class AccountsName
{
    public string Name { get; internal set; }
    public decimal LDF { get; internal set; }
    public decimal Amount { get; internal set; }
    public decimal Total { get; internal set; }
    public decimal KetteringPiwc { get; internal set; }
    public decimal NorthamptonPiwc { get; internal set; }
    public decimal KetteringAkan { get; internal set; }
    public decimal MountZion { get; internal set; }
    public decimal Wellingborough { get; internal set; }
    public decimal Branch1015 { get; internal set; }
    public decimal Branch1016 { get; internal set; }
    public decimal Branch1017 { get; internal set; }
    public decimal Branch1018 { get; internal set; }
    public decimal Branch1019 { get; internal set; }
    public decimal Branch1020{ get; internal set; }
    public decimal Branch1021{ get; internal set; }
    public decimal Branch1022{ get; internal set; }
    public decimal Branch1023{ get; internal set; }
    public decimal Branch1024 { get; internal set; }
    public decimal Branch1025 { get; internal set; }
    public decimal Branch1026 { get; internal set; }
    public decimal Branch1027 { get; internal set; }
    public decimal Branch1028 { get; internal set; }
    public decimal Branch1029 { get; internal set; }
    public decimal Branch1030 { get; internal set; }
}