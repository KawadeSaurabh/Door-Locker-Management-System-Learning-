table 50458 "Seed QC Test"
{
    Caption = 'Seed QC Test';
    DataClassification = CustomerContent;
    LookupPageId = "Seed QC Test List";
    DrillDownPageId = "Seed QC Test List";

    fields
    {
        field(1; "Test No."; Code[20])
        {
            Caption = 'Test No.';
            NotBlank = true;
        }

        field(2; "Seed Code"; Code[20])
        {
            Caption = 'Seed Code';
            DataClassification = CustomerContent;
            TableRelation = "Seed Master"."Seed Code";
        }

        field(3; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }

        field(4; "Test Date"; Date)
        {
            Caption = 'Test Date';
        }

        field(5; "QC Status"; Option)
        {
            Caption = 'QC Status';
            OptionMembers = Open,"In Progress",Passed,Failed;
            InitValue = Open;
        }
    }

    keys
    {
        key(PK; "Test No.")
        {
            Clustered = true;
        }

        key(StatusDateKey; "QC Status", "Test Date")
        {

        }
    }


    fieldgroups
    {
        fieldgroup(DropDown; "Test No.", "Seed Code", "Test Date")
        {

        }
    }

    procedure TestStatusDateSorting()
    var
        QCTest: Record "Seed QC Test";
    begin
        QCTest.SetCurrentKey("QC Status", "Test Date");

        if QCTest.FindSet() then
            repeat
                Message('Test No.: %1, Status: %2, Date: %3',
                QCTest."Test No.",
                Format(QCTest."QC Status"),
                Format(QCTest."Test Date"));
            until QCTest.Next() = 0;
    end;
}
