using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Minister_Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void aLogout_Click(object sender, EventArgs e)
    {
        try
        {
       // Session["user"] = null;
        Response.Redirect("../default.aspx");
        }
        catch (Exception)
        {

           
        }
       
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        try
        {
            containerSearchReport.Controls.Clear();
            string searchstring = this.TextBoxSearch.Text;
            if (searchstring.Length<2)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myAlert", "alert('String length to search must be more than 2 characters long')", true);
                return;
            }
            //if (string.IsNullOrEmpty(memberID) || string.IsNullOrWhiteSpace(memberID)) return;
            if (string.IsNullOrEmpty(searchstring) || string.IsNullOrWhiteSpace(searchstring)) return;
            //find search string in member firstname and lastname and return
            //only members in areas and district member is part of
            Func<string, string> makeStringValid = (input) => { return Regex.Replace(input, "<.*?>", String.Empty); };
            var ctx = new DistrictDBEntities();
            //query database using Fulltext index on catalog default
            searchstring = makeStringValid(searchstring);//remove malicious html markup
            string sql = "SELECT   Members.Member.* FROM   Members.Member WHERE CONTAINS(Members.Member.*, '"+ searchstring + "')";
            var result=ctx.Members.SqlQuery(sql,new object[] { });
            //var items =result.ToList();
            var query = result
                .OrderBy(i=>i.LastName)
                .Select(i => new {
                    i.FirstName,
                    i.LastName,
                    Area=ctx.BranchGroupings.Where(p=>p.BranchGroupingType=="Area"&&p.BranchID==i.BranchID).Select(p=>p.GroupingName).FirstOrDefault(),
                    District = ctx.BranchGroupings.Where(p => p.BranchGroupingType == "District" && p.BranchID == i.BranchID).Select(p => p.GroupingName).FirstOrDefault(),
                    Local = ctx.Branches.Where(p=>p.ID==i.BranchID).Select(p=>p.Name).FirstOrDefault(),
                    i.MemberID,
                    i.BranchID,
                    i.Title,
                    i.Telephone
                    
                }).ToList();
            if (query.Count() == 0) {
                textSearchResult.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myAlert", "alert('No Members found')", true);

            }
            textSearchResult.Text = query.Count().ToString();
            
            HtmlTable table = new HtmlTable() { ID = "tbodysSearchResult" };
            table.Attributes.Add("class", "table table-striped table-responsive");
            containerSearchReport.Controls.Add(table);
            HtmlTableRow trhead = new HtmlTableRow();
            trhead.Cells.Add(new HtmlTableCell() { InnerText = "MemberID" });
            trhead.Cells.Add(new HtmlTableCell() { InnerText = "Title" });


            //create drop down filter for selection of firstname
            trhead.Cells.Add(new HtmlTableCell() {   });
            HtmlSelect htmlSelectFirstName = new HtmlSelect() { }; htmlSelectFirstName.Attributes.Add("class", "p-2");
            htmlSelectFirstName.Style.Add("border", "none");
            //create table column header filters 
            #region

            htmlSelectFirstName.Items.Add("FirstName");
            htmlSelectFirstName.SelectedIndex = 0;
            query.Select(i => i.FirstName).Distinct().OrderBy(i=>i)
                .ToList()
                .ForEach((item) => {
                    htmlSelectFirstName.Items.Add(item);
                });
            trhead.Cells[2].Controls.Add(htmlSelectFirstName);
            //create drop down filter for selection of lastname
            trhead.Cells.Add(new HtmlTableCell() {  });
            HtmlSelect htmlSelectLastName = new HtmlSelect() {  }; htmlSelectLastName.Attributes.Add("class","p-2");
            htmlSelectLastName.Items.Add("LastName");
            htmlSelectLastName.SelectedIndex = 0;
            htmlSelectLastName.Style.Add("border", "none");

            query.Select(i=>i.LastName).Distinct().OrderBy(i=>i)
                .ToList()
                .ForEach((item) => {
                    htmlSelectLastName.Items.Add(item);
            });
            trhead.Cells[3].Controls.Add(htmlSelectLastName);

            string sz = new JavaScriptSerializer().Serialize(query);


            trhead.Cells.Add(new HtmlTableCell() { });
            HtmlSelect htmlSelectArea = new HtmlSelect() { }; htmlSelectArea.Attributes.Add("class", "p-2");
            htmlSelectArea.Items.Add("Area");
            htmlSelectArea.SelectedIndex = 0;
            htmlSelectArea.Style.Add("border", "none");

            query.Select(i => i.Area).Distinct().OrderBy(i => i)
                .ToList()
                .ForEach((item) => {
                    htmlSelectArea.Items.Add(item);
                });
            trhead.Cells[4].Controls.Add(htmlSelectArea);



            //Create head filter for district
            trhead.Cells.Add(new HtmlTableCell() {  });
            HtmlSelect htmlSelectDistrict = new HtmlSelect() { }; htmlSelectDistrict.Attributes.Add("class", "p-2");
            htmlSelectDistrict.Items.Add("District");
            htmlSelectDistrict.SelectedIndex = 0;
            htmlSelectDistrict.Style.Add("border", "none");
            htmlSelectDistrict.Style.Add("width", "100%");

            query.Select(i => i.District).Distinct().OrderBy(i => i)
                .ToList()
                .ForEach((item) => {
                    htmlSelectDistrict.Items.Add(item);
                });
            trhead.Cells[5].Controls.Add(htmlSelectDistrict);

            htmlSelectLastName.Attributes.Add("onchange", "new $rab.Search().Filter(" + sz + ",'LastName',this.value" + ")");
            htmlSelectFirstName.Attributes.Add("onchange", "new $rab.Search().Filter(" + sz + ",'FirstName',this.value" + ")");
            htmlSelectArea.Attributes.Add("onchange", "new $rab.Search().Filter(" + sz + ",'Area',this.value" + ")");
            htmlSelectDistrict.Attributes.Add("onchange", "new $rab.Search().Filter(" + sz + ",'District',this.value" + ")");

            
            #endregion
            trhead.Cells.Add(new HtmlTableCell() { InnerText = "Local" });
            trhead.Cells.Add(new HtmlTableCell() { InnerText = "Telephone"});
            trhead.Cells.Add(new HtmlTableCell() { InnerText = "More" });
            table.Rows.Add(trhead);
            trhead.Attributes.Add("class", "tablehead");
            int x = 0;
            foreach (var item in query)
            {
                try
                {
                    x++;
                    HtmlTableRow tr = new HtmlTableRow();
                    tr.Cells.Add(new HtmlTableCell() { InnerText=item.MemberID.ToString() });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.Title });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.FirstName });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.LastName });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.Area });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.District });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.Local });
                    tr.Cells.Add(new HtmlTableCell() { InnerText = item.Telephone });
                    tr.Cells.Add(new HtmlTableCell() { });
                    //var inputbutton=new 
                    var button = new HtmlInputButton() {  Value = "details" };
                    button.Attributes.Add("onclick", "new $rab.Search().Members("+ new JavaScriptSerializer().Serialize(item) + ")");
                    tr.Cells[8].Controls.Add(button);
                    button.Attributes.Add("record", new JavaScriptSerializer().Serialize(item));
                    //button.Attributes.
                    table.Rows.Add(tr);
                }
                catch (Exception)
                {

                    
                }
               
            }
            //new $rab.Branch().TableFilter('searchTextBox', 'tbodysSearchResult');
            ScriptManager.RegisterStartupScript(this, this.GetType(), "start", "new $rab.Branch().TableFilter('searchTextBox', 'tbodysSearchResult')", true);

        }
        catch (Exception ex)
        {

            
        }
    }

    
}