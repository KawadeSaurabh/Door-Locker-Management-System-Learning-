
table 50459 "Seed QC Result"
{
    Caption = 'Seed QC Result';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Result No."; Code[20])
        {
            Caption = 'Result No.';
            NotBlank = true;
        }

        field(2; "Test No."; Code[20])
        {
            Caption = 'Test No.';
            TableRelation = "Seed QC Test"."Test No.";
        }

        field(3; "Germination %"; Decimal)
        {
            Caption = 'Germination %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }

        field(4; "Physical Purity %"; Decimal)
        {
            Caption = 'Physical Purity %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }

        field(5; "Moisture %"; Decimal)
        {
            Caption = 'Moisture %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK; "Result No.")
        {
            Clustered = true;
        }
    }
}
