File.open(Rails.root.join('spec', 'fixtures', 'files', 'invoice.csv'), 'w') do |file|
  file.write("number,date,total\nINV-001,2024-01-15,100.50\nINV-002,2024-02-20,250.75\nINV-003,2024-03-10,175.00\nINV-004,2024-04-05,300.00\nINV-005,2024-05-12,125.25\n")
end