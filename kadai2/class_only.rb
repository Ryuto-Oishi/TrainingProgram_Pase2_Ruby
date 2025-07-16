class Class_Only
    def initialize(row)
        @id = row['no'],
        @name = row['namae'],
        @ruby = row['rubi'],
        @sex = row['seibetu'],
        @tel = row['denwa'],
        @mobile = row['keitai'],
        @mail = row['mair'],
        @zip = row['yuubinbango'],
        @address1 = row['jusho1'],
        @address2 = row['jusho2'],
        @address3 = row['jusho3'],
        @address4 = row['jusho4'],
        @address5 = row['jusho5'],
        @birthday = row['tanjobi']
    end

    def name
        puts @name
    end
end