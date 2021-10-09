using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Finances : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static DistrictDBEntities db = new DistrictDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void aLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("../default.aspx");
    }
    [WebMethod]
    public static string Add(string memberID, string Description, string Source,
                   string Name, string AccountType, string BranchName, string Paymode, string Date, string Amount)
    {
        string message = "failed adding account";
        try
        {
            if (memberID == "") throw new Exception("Invalid member id");
            if (Description == "") throw new Exception("Invalid description");
            if (Source == "") throw new Exception("Invalid source");
            if (Name == "") throw new Exception("Invalid Name");
            if (AccountType == "") throw new Exception("Invalid account type");
            if (BranchName == "") throw new Exception("Invalid branch name");
            if (Paymode == "") throw new Exception("Invalid paymode");
            if (Date == "") throw new Exception("Invalid date");
            if (double.Parse(Amount) == 0.00) throw new Exception("Invalid amount");

            int branchid = db.Branches.Where(i => i.Name == BranchName).Select(i => i.ID).FirstOrDefault();
            decimal amount = Convert.ToDecimal(Amount);
            string mm = DateTime.Now.Month.ToString().Length == 1 ? "0" + DateTime.Now.Month.ToString() : DateTime.Now.Month.ToString();
            string dd = DateTime.Now.Day.ToString().Length == 1 ? "0" + DateTime.Now.Day.ToString() : DateTime.Now.Day.ToString();
            string createon = DateTime.Now.Year.ToString() + mm + dd;
            int memid = int.Parse(memberID);
            Finance fd = new Finance()
            {
                Description = Description,
                Source = Source,
                Name = Name,
                AccountType = AccountType,
                BranchID = branchid,
                Paymode = Paymode,
                Date = int.Parse(Date),
                Amount = amount,
                CreatedOn = int.Parse(createon),
                CreatedBy = memid
            };
            db.Finances.Add(fd);
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "Update successful",
                Result = new
                {
                    FinanceID = fd.ID,
                    Description = fd.Description,
                    Source = fd.Source,
                    Name = fd.Name,
                    AccountType = fd.AccountType,
                    BranchName = db.Branches.Where(i => i.ID == fd.BranchID).Select(i => i.Name).FirstOrDefault(),
                    Paymode = fd.Paymode,
                    Date = fd.Date,
                    Amount = fd.Amount,
                    CreatedBy = db.Members.Where(i => i.MemberID == fd.CreatedBy).Select(i => i.FirstName + " " + i.LastName).FirstOrDefault(),
                    CreatedOn = fd.CreatedOn
                }
            });

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string Update(int FinanceID, string Description, string Source, string Name, string AccountType, string BranchID, string Paymode, string Date, string Amount)
    {
        string message = "failed adding account";
        try
        {
            int branchid = int.Parse(BranchID);
            decimal amount = Convert.ToDecimal(Amount);

            Finance entity = db.Finances.Find(FinanceID);
            entity.Description = Description;
            entity.Source = Source;
            entity.Name = Name;
            entity.AccountType = AccountType;
            entity.BranchID = branchid;
            entity.Paymode = Paymode;
            entity.Date = int.Parse(Date);
            entity.Amount = amount;

            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();
            //db.SaveChanges();
            message = "Update successful";
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetAccountsSummary(string branchName)
    {
        string message = "failed getting account records";
        try
        {
            if (branchName == "Select branch") throw new Exception("Invalid branch Name");
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            //
            if (branchName == "All")
            {
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances
                          .OrderByDescending(p=>p.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy = i.CreatedBy,
                              CreatedOn = i.CreatedOn
                          })
                });
            }
            else
            {
                if (branchid == 0) throw new Exception("Invalid branch Name");
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances.
                          Where(i => i.BranchID == branchid).
                          OrderByDescending(i => i.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.Name == branchName).Select(y => y.Name),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy = db.Members.Where(g => g.MemberID == i.CreatedBy).Select(g => g.FirstName + " " + g.LastName).FirstOrDefault(),
                              CreatedOn = i.CreatedOn
                          })
                });
            }

        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string GetAccountsSummaryByBranchAccountType(string branchName, string accountType)
    {
        string message = "failed getting account records";
        try
        {
            if (branchName == "Select branch") throw new Exception("Invalid branch Name");
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            //
            if (branchName == "All" && accountType == "All")
            {
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances
                          .OrderByDescending(p=>p.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy =db.Members.Where(p=>p.MemberID== i.CreatedBy).Select(p=>p.LastName+ " "+p.FirstName).FirstOrDefault(),
                              CreatedOn = i.CreatedOn
                          }) 
                });
            }
            else if (branchName == "All" && accountType != "All")
            {
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances.
                          //Where(i => i.BranchID == branchid).
                          Where(i => i.AccountType == accountType).
                          OrderByDescending(i => i.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy = db.Members.Where(p => p.MemberID == i.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                              CreatedOn = i.CreatedOn
                          }) 
                });
            }
            else if (branchName != "All" && accountType == "All")
            {
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances.
                          Where(i => i.BranchID == branchid).
                          //Where(i => i.AccountType == accountType).
                          OrderByDescending(i => i.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy = db.Members.Where(p => p.MemberID == i.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                              CreatedOn = i.CreatedOn
                          })
                });
            }
            else
            {
                if (branchid == 0) throw new Exception("Invalid branch Name");
                message = sz.Serialize(new
                {
                    message = "Update successful",
                    Result = db.Finances.
                          Where(i => i.BranchID == branchid).
                          Where(i => i.AccountType == accountType).
                          OrderByDescending(i => i.ID)
                          .Select(i => new
                          {
                              FinanceID = i.ID,
                              Description = i.Description,
                              Source = i.Source,
                              Name = i.Name,
                              AccountType = i.AccountType,
                              BranchName = db.Branches.Where(y => y.Name == branchName).Select(y => y.Name),
                              Paymode = i.Paymode,
                              Date = i.Date,
                              Amount = i.Amount,
                              CreatedBy = db.Members.Where(g => g.MemberID == i.CreatedBy).Select(g => g.FirstName + " " + g.LastName).FirstOrDefault(),
                              CreatedOn = i.CreatedOn
                          })
                });
            }

        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string AddTransaction(string MemberID, string ID, string ReferenceNumber, string TransactionType, string AuthourisingPerson, string BranchID, string Paymode, string Date, string Amount)
    {
        string message = "failed adding account";
        //try
        //{
        //    if (MemberID == "") throw new Exception("Invalid member id");
        //    if (ID == "") throw new Exception("Invalid id");
        //    if (ReferenceNumber == "") throw new Exception("Invalid ReferenceNumber");
        //    if (TransactionType == "") throw new Exception("Invalid transaction type");
        //    if (AuthourisingPerson == "") throw new Exception("Invalid authourising person");
        //    if (BranchID == "") throw new Exception("Invalid branch ID");
        //    if (Paymode == "") throw new Exception("Invalid paymode");
        //    if (Date == "") throw new Exception("Invalid date");
        //    if (double.Parse(Amount) == 0.00) throw new Exception("Invalid amount");

        //    int branchid = int.Parse(BranchID);
        //    decimal amount = Convert.ToDecimal(Amount);
        //    string createon = DateTime.Now.ToShortDateString();
        //    int memid = int.Parse(MemberID);
        //    BankTransaction fd = new BankTransaction()
        //    {
        //        TransactionID = int.Parse(ID),
        //        ReferenceNumber = ReferenceNumber,
        //        TransactionType = TransactionType,
        //        AuthourisingPerson = AuthourisingPerson,
        //        BranchID = branchid,
        //        Paymode = Paymode,
        //        Date = Date,
        //        Amount = amount,
        //        CreatedOn = createon,
        //        MemberID = memid
        //    };
        //    db.BankTransactions.Add(fd);
        //    db.SaveChanges();
        //    message = sz.Serialize(new
        //    {
        //        message = "Update successful",
        //        Result = new
        //        {
        //            BankTransactionID = fd.ID,
        //            ReferenceNumber = fd.ReferenceNumber,
        //            TransactionType = fd.TransactionType,
        //            AuthourisingPerson = fd.AuthourisingPerson,
        //            //AccountType = fd.AccountType,
        //            BranchName = db.Branches.Where(i => i.ID == fd.BranchID).Select(i => i.Name).FirstOrDefault(),
        //            Paymode = fd.Paymode,
        //            Date = fd.Date,
        //            Amount = fd.Amount,
        //            CreatedBy = db.Members.Where(i => i.MemberID == fd.MemberID).Select(i => i.FirstName + " " + i.LastName).FirstOrDefault(),
        //            CreatedOn = fd.CreatedOn
        //        }
        //    });

        //}
        //catch (Exception ex)
        //{

        //    //throw;
        //}
        return message;
    }
    [WebMethod]
    public static string Aggregation(string branchName, string fromdate, string todate)
    {
        string message = "failed getting aggregation";
        try
        {
            message = new FinanceAggregation().AccountName(branchName, fromdate, todate);
            // sz.Serialize(new
            //{
            //    Result = new FinanceAggregation().AccountsContribution(branchName,fromdate, todate),
            //    Message = "Update successful",
            //    BreakDown= ,
            //});
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;


    }
    [WebMethod]
    public static string AccountFilters(string branchName)
    {
        string message = "failed getting account filters";
        try
        {
            int branchid = db.Branches.Where(p => p.Name == branchName).Select(p => p.ID).FirstOrDefault();
            message = sz.Serialize(new {
                message="load successful",
                ExpenditureItem=db.FinanceExpenditureItems
                //.Where(i=>i.BranchID==branchid)
                .Select(i=>new {
                    Name = i.Name,
                    Description =i.Description,
                    Source=i.Source,
                    BranchName=db.Branches.Where(p=>p.Name== branchName).Select(p=>p.ID).FirstOrDefault()
                }).Distinct(),
                ExpenditureSource = db.FinanceExpenditureSources.Select(i => new {
                    Name = i.Source
                }),
                IncomeItem = db.FinanceIncomeItems
               // .Where(i => i.BranchID == branchid)
                .Select(i => new {
                    Name = i.Name,
                    Description = i.Description,
                    Source = i.Source,
                    BranchName = db.Branches.Where(p => p.Name == branchName).Select(p => p.ID).FirstOrDefault()
                }).Distinct(),
                IncomeSource = db.FinanceIncomeSources.Select(i => new {
                    Name = i.Source
                }).Distinct(),
                Paymode = db.FinancePayModes.Select(i => new {
                    Name = i.PayMode
                }).Distinct()
            });
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddAccountFilters(string accountName,string name,
                                           string description,string branchName,string source)
    {
        string message = "failed adding filter";
        try
        {
            int intbranchID = db.Branches.Where(i=>i.Name==branchName).Select(i=>i.ID).First();
            if (accountName=="Income")
            {
                
                db.FinanceIncomeItems.Add(new FinanceIncomeItem() {
                     Name=name,
                     Description=description,
                     Date=DateTime.Today,
                     BranchID= intbranchID,
                     Source=source

                });
                db.SaveChanges();
            }
            else if (accountName == "Expenditure")
            {
                db.FinanceExpenditureItems.Add(new FinanceExpenditureItem()
                {
                    Name = name,
                    Description = description,
                    Date = DateTime.Today,
                    BranchID = intbranchID,
                    Source = source

                });
                db.SaveChanges();
            }
            else if (accountName == "Assets")
            {

            }
            else if (accountName == "Liability")
            {

            }
            message = AccountFilters(branchName);




        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    public static string Update(string FinanceID,string memberID, string Description, string Source,
                   string Name, string AccountType, string BranchName, string Paymode, string Date, string Amount)
    {
        string message = "failed adding account";
        try
        {
            if (string.IsNullOrEmpty(FinanceID )) throw new Exception("Invalid member id");
            if (string.IsNullOrEmpty(memberID )) throw new Exception("Invalid member id");
            if (string.IsNullOrEmpty(Description )) throw new Exception("Invalid description");
            if (string.IsNullOrEmpty(Source )) throw new Exception("Invalid source");
            if (string.IsNullOrEmpty(Name )) throw new Exception("Invalid Name");
            if (string.IsNullOrEmpty(AccountType )) throw new Exception("Invalid account type");
            if (string.IsNullOrEmpty(BranchName )) throw new Exception("Invalid branch name");
            if (string.IsNullOrEmpty(Paymode )) throw new Exception("Invalid paymode");
            if (string.IsNullOrEmpty(Date )) throw new Exception("Invalid date");
            if (double.Parse(Amount) == 0.00) throw new Exception("Invalid amount");

            int branchid = db.Branches.Where(i => i.Name == BranchName).Select(i => i.ID).FirstOrDefault();
            decimal amount = Convert.ToDecimal(Amount);
            string mm = DateTime.Now.Month.ToString().Length == 1 ? "0" + DateTime.Now.Month.ToString() : DateTime.Now.Month.ToString();
            string dd = DateTime.Now.Day.ToString().Length == 1 ? "0" + DateTime.Now.Day.ToString() : DateTime.Now.Day.ToString();
            string createon = DateTime.Now.Year.ToString() + mm + dd;
            int memid = int.Parse(memberID);
            //Find record in database and update content
            Finance fd = db.Finances.Find(int.Parse(FinanceID));
            
                fd.Description = Description;
                fd.Source = Source;
                fd.Name = Name;
                fd.AccountType = AccountType;
                fd.BranchID = branchid;
                fd.Paymode = Paymode;
                fd.Date = int.Parse(Date);
                fd.Amount = amount;
                fd.CreatedOn = int.Parse(createon);
                fd.CreatedBy = memid;
            
            db.Finances.Add(fd);
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "Update successful",
                Result = new
                {
                    FinanceID = fd.ID,
                    Description = fd.Description,
                    Source = fd.Source,
                    Name = fd.Name,
                    AccountType = fd.AccountType,
                    BranchName = db.Branches.Where(i => i.ID == fd.BranchID).Select(i => i.Name).FirstOrDefault(),
                    Paymode = fd.Paymode,
                    Date = fd.Date,
                    Amount = fd.Amount,
                    CreatedBy = db.Members.Where(i => i.MemberID == fd.CreatedBy).Select(i => i.FirstName + " " + i.LastName).FirstOrDefault(),
                    CreatedOn = fd.CreatedOn
                }
            });

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }


}