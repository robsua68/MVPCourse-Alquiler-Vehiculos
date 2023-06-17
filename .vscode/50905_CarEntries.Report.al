report 50905 "Car Entries"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Car Entries Report';
    DefaultRenderingLayout = CarEntries;
    
    dataset
    {
        dataitem(Car;Car)
        {
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;

            column(No_;"No.")
            {
                
            }

            column(Name;Name)
            {

            }

            column(Brand_Code;"Brand Code")
            {

            }

            dataitem("Car Entry";"Car Entry")
            {
                DataItemLinkReference = Car;
                DataItemLink = "Car no." = field("No.");
                RequestFilterFields = "Posting date", "Entry type";

                column(Posting_date;"Posting date")
                {

                }

                column(Entry_type;"Entry type")
                {

                }

                column(Description;Description)
                {


                }

            }
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    rendering
    {
        layout(CarEntries)
        {
            Type = RDLC;
            LayoutFile = '.\Reports\CarEntries.rdl';
        }
    }
    
    var
        myInt: Integer;
}