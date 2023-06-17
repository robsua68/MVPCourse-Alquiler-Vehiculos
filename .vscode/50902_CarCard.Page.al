page 50902 "Car Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Car;
    
    layout
    {
        area(Content)
        {
            group(General)
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

                field("Extended Name";Rec."Extended Name")
                {
                    ApplicationArea = All;
                }
                
            }

            group(Technical)
            {
                field(Gears;Rec.Gears)
                {
                    ApplicationArea = All;
                }

                field("Engine Power";Rec."Engine Power")
                {
                    ApplicationArea = All;
                }

                field(Electric;Rec.Electric)
                {
                    ApplicationArea = All;
                }
            }

            group(Administrative)
            {
                field("Acquisition Date";Rec."Acquisition Date")
                {
                    ApplicationArea = All;
                }

                field(Plate;Rec.Plate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(PrintCarEntries)
            {
                ApplicationArea = All;
                Caption = 'Print Car Entries';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                
                trigger OnAction();
                var
                    CurrentCar: Record Car;

                begin
                    
                    CurrentCar.Init();
                    CurrentCar.SetRange("No.", Rec."No.");

                    REPORT.RUNMODAL(Report::"Car Entries", true, false, CurrentCar);
                    
                end;
            }
        }
    }
    
}