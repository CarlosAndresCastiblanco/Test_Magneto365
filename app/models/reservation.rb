class Reservation

  USER_FORMATS = {
      :firstname_lastname => {
          :string => '#{firstname} #{lastname}',
          :order => %w(firstname lastname id),
          :setting_order => 1
      },
      :firstname_lastinitial => {
          :string => '#{firstname} #{lastname.to_s.chars.first}.',
          :order => %w(firstname lastname id),
          :setting_order => 2
      },
      :firstinitial_lastname => {
          :string => '#{firstname.to_s.gsub(/(([[:alpha:]])[[:alpha:]]*\.?)/, \'\2.\')} #{lastname}',
          :order => %w(firstname lastname id),
          :setting_order => 2
      },
      :firstname => {
          :string => '#{firstname}',
          :order => %w(firstname id),
          :setting_order => 3
      },
      :lastname_firstname => {
          :string => '#{lastname} #{firstname}',
          :order => %w(lastname firstname id),
          :setting_order => 4
      },
      :lastnamefirstname => {
          :string => '#{lastname}#{firstname}',
          :order => %w(lastname firstname id),
          :setting_order => 5
      },
      :lastname_comma_firstname => {
          :string => '#{lastname}, #{firstname}',
          :order => %w(lastname firstname id),
          :setting_order => 6
      },
      :lastname => {
          :string => '#{lastname}',
          :order => %w(lastname id),
          :setting_order => 7
      },
      :username => {
          :string => '#{login}',
          :order => %w(login id),
          :setting_order => 8
      },
  }
end

