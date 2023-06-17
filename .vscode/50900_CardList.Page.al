page 50900 "Car List"
{
    Caption = 'Car List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Car;
    Editable = false;
    CardPageId = "Car Card";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Name;Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Brand Code";Rec."Brand Code")
                {
                    ApplicationArea = All;
                }
                
            }
        }
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(PrintCarList)
            {
                ApplicationArea = All;
                Caption = 'Print Car List';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                
                trigger OnAction();
                begin

                    REPORT.RUNMODAL(Report::"Car list");
                    
                end;
            }

            action(PrintCarEntries)
            {
                ApplicationArea = All;
                Caption = 'Print Car Entries';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                
                trigger OnAction();
                var
                    CarRecord: Record Car;

                begin

                    CarRecord.Init();
                    CurrPage.SetSelectionFilter(CarRecord);

                    REPORT.RUNMODAL(Report::"Car Entries", true, false, CarRecord);
                    
                end;
            }
        }
    }
}