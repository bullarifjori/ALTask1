page 50201 "ItemVariantsPage"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ItemVariant;
    Caption = 'ItemVariantsPage';

    layout
    {
        area(Content)
        {
            repeater(Controll)
            {

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;

                }
                field("Vendor name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}