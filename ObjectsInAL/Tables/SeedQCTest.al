
table 50458 "Seed QC Test"
{
    Caption = 'Seed QC Test';
    DataClassification = CustomerContent;

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
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Test No.", "Seed Code", "Test Date")
        {
        }
    }
}
