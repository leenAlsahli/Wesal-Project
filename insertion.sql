INSERT INTO departments (name, description) VALUES
('ITSupport', 'handles technical issues and tickets'),
('Sales', 'Handles customer subscription and sales'),
('HR', 'human resources and employee management'),
('Finance', 'Manages payroll, billing, and accounting operations'),
('Marketing', 'Handles advertising, campaigns, and public relations'),
('Quality Assurance (QA)', 'Oversees product testing and ensures services meet required standards and reliability');

INSERT INTO users (user_id, first_name, last_name, email) VALUES
('1011234567', 'Norah', 'Helal', 'norahaldakheel1441@gmail.com'),
('1019876543', 'Lama', 'Saleh', 'lamaSaleh@gmail.com'),
('1234567890', 'Thmanyah', 'Company', 'contact1@thmanyah.com'),
('1015555555', 'John', 'Doe', 'john1@gmail.com'),
('1016667777', 'Sarah', 'Ali', 'sarahaliii3@gmail.com'),
('1001554723', 'Haifaa', 'Mohammed', 'haifaaMoh@gmail.com'),
('1211830273', 'Faisal', 'AlOtaibi', 'otbfaisal@gmail.com'),
('1008728973', 'Fatimah', 'Salman', 'fatimahs122@gmail.com'),
('9998887776', 'STC', 'Solutions', 'support@stcs.com.sa'),
('1191445233', 'Khalid', 'AlGhamdi', 'khaaalid1461@gmail.com'),
('1152318253', 'Nouf', 'Fahad', 'nouf.f@gmail.com'),
('0000000000', 'Jarir', 'Bookstore', 'care@jarir.com'),
('1192757142', 'dhay', 'Fahad', 'dhay_2@gmail.com'),
('1127302739', 'Ahmad', 'Alsaad', 'ahmadsss@gmail.com');


INSERT INTO user_phone (u_id, phone_number) VALUES
('1011234567', '0504709942'),
('1019876543', '0501234567'),
('1001554723', '0509010000'),
('1211830273', '0507008000'),
('1008728973', '0505006000'),
('1191445233', '0503004000'),
('1192757142', '0503334445'),
('1234567890', '0112223333'),
('1015555555', '0555555555'),
('1015555555', '0134567890'),
('1016667777', '0559998888'),
('9998887776', '0114445555'),
('1152318253', '0553034040'),
('0000000000', '920000089'),
('1127302739', '0551012020'),
('1127302739', '0551239876');


INSERT INTO employees (user_id, job_title, salary, dept_id) VALUES
('1011234567', 'Senior Technician', 25000.00, 1),
('1019876543', 'HR Specialist', 12000.00, 3),
('1191445233', 'Sales Manager', 28000.00, 2),
('1001554723', 'Quality Tester', 40000.00, 6),
('1211830273', 'Digital Strategist', 16000.00, 5),
('1008728973', 'Accountant', 36000.00, 4),
('1192757142', 'Recruitment Coordinator', 35000.00, 3);

INSERT INTO customers (user_id, customer_type, organization_name) VALUES
('1234567890', 'Organization', 'Thmanyah'),--شركة ثمانية
('1015555555', 'Individual', NULL),--john
('1016667777', 'Individual', NULL),--سارة
('9998887776', 'Organization', 'STC Solutions'),-- شركة stc Solutions
('0000000000', 'Organization', 'Jarir'),--شركة مكتبة جرير
('1152318253', 'Individual', NULL),-- نوف
('1127302739', 'Individual', NULL); --احمد 

--  support agents اضافة
Insert into support_agent (sagent_id,f_name, l_name, email, role, skills, dept_id) Values
( '1101552135','Leen' , 'AlSahli' ,'Leenfahadals@gmail.com','Head of Strategic Solutions','Designing Complex Systems' , 1),
( '1090123456' ,'Maha' , 'AlHarthi' ,'Maha.alharthi@gmail.com','Senior Sales Executive','Customer Relationship Management' , 2),   
('1160265172' ,'Reema' , 'AlAli' ,'ReemaAl@gmail.com','Technical Solutions Manager','Infrastructure Project Management' , 1),
( '1170265134' ,'Sara' , 'Abdullah' ,'SaraAbdullah1@gmail.com','HR Assistant','HRIS Management' , 3),
( '1141662133' ,'Atheer' , 'fahad' ,'atheerals@gmail.com','Billing Specialist','Invoice Processing and Reconciliation' , 4),    
( '1102103604' ,'Bedoor' , 'Bader' ,'Bedoor_baderal@gmail.com','Marketing Campaign Specialist','Digital Advertising and Data Analysis' , 5), 
( '1145281619' ,'muhammad' , 'AlDossary' ,'Talal.aldossary@gmail.com','Test Engineer','Automated Testing and Bug Reporting' , 6),
( '1105086047' ,'Athbah' , 'Abdullahadi' ,'athbaaah_1@gmail.com','Technical Support Analyst','Troubleshooting and System Diagnostics' , 1); 


--اضافة ارقام هواتف الوكلاء
Insert into support_agent_phone (phone, sagent_id) VALUES
('0509209585', '1101552135'), --  هاتف لين
('0541001000', '1160265172'), -- هاتف ريما 1
('0562002000',  '1170265134'), -- هاتف سارة
('0508369208', '1090123456'), -- هاتف مها 
('0556271973', '1141662133'), -- هاتف أثير 
('0501623922', '1102103604'), -- هاتف بدور  
('0541001001', '1160265172'), -- هاتف ريما 2 
('0502133423', '1145281619'), -- هاتف محمد  
('0556379253', '1105086047'), -- هاتف عذبة 
('0504852267', '1105086047'); -- 2هاتف عذبة 


--اضافة التذاكر
Insert into ticket (title, description, status, priority, creation_date, resloution_date, sagent_id, dept_id, user_id) VALUES
-- Ticket 1 :  it عيننا تذكرة نورة الى لين في قسم الـ 
('New Office Network Expansion Project', 'Design and plan the infrastructure setup for 30 new employees.', 'open', 'urgent', '2025-12-05', NULL, '1101552135', 1, '1011234567'), 
-- ticket 2 :  it عيننا تذكرة شركة ثمانية الى ريما في قسم الـ 
('Sales Main Server Downtime', 'Access to the main sales database is currently impossible, requires senior technical intervention.', 'in progress', 'high', '2025-12-04', NULL, '1160265172', 1,'1234567890'),
-- Ticket 3 :  hr عيننا تذكرة لمى الى ساره في قسم الـ 
('Annual Leave Balance Inquiry', 'Confirmation of remaining annual leave days before the year end.', 'closed', 'low', '2025-11-10', '2025-11-12', '1170265134', 3, '1019876543'), 
-- ticket 4:  sales عيننا تذكرة جون  الى مها قسم  
('Customer Invoice Dispute', 'Customer claims there is an error in the invoiced amount.', 'open', 'low', '2025-12-06', NULL, '1090123456', 2, '1015555555'),
-- Ticket 5:  it عيننا تذكرة سارة علي الى عذبة في قسم  
('Corporate VPN Access Failure', 'Cannot connect to the corporate network from home after recent update.', 'closed', 'low', '2025-11-20', '2025-11-20', '1105086047', 1, '1016667777'), 
-- Ticket 6:  sales عيننا تذكرة شركة اس تي سي الى مها في قسم   
('New Service Integration API Request', 'Need documentation and sandbox access for integrating new service APIs.', 'open', 'high', '2025-12-07', NULL, '1090123456', 2, '9998887776'), 
-- Ticket 7:  accounting عيننا تذكرة شركة ثمانية الى أثير  
('Monthly Billing Reconciliation Error', 'Discrepancy in the final amount of the monthly service invoice.', 'open', 'medium', '2025-12-09', NULL, '1141662133', 4, '1234567890'), 
-- Ticket 8:  hr عيننا تذكرة لمى الى ساره في قسم الـ 
('Medical Insurance Policy Amendment', 'Request to upgrade the insurance category for my dependent.', 'open', 'medium', '2025-12-01', NULL, '1170265134', 3, '1019876543');


-- INSERTION (FEEDBACK , ATTACHMENT)
INSERT INTO Feedback(comment,u_id,rating) VALUES 
('Great service !','1011234567',3),-- كومنت التكت مع اليوزر اي دي لصاحب التكت
('Problem happened again','1019876543',4),
('Agent assigned was friendly','1015555555',5),
('Quick response time', '1234567890', 5), 
('Long wait time, but the issue was resolved', '9998887776', 3), 
('Much better this time','1019876543',4),
(' agent was helpful.', '1234567890', 2); 

INSERT INTO Attachment(T_id, file_size, file_name, file_type) VALUES
(1, '2MB', 'error.png', 'png'),    
(2, '200KB', 'info.txt', 'text'),     
(3, '9.8MB', 'report.pdf', 'pdf'),   
(4, '350KB', 'invoice_copy_2025.jpg', 'jpg'),  
(5, '1.1MB', 'vpn_error_screenshot.jpg', 'jpg'), 
(6, '50KB', 'integration_requirements.doc', 'doc'), 
(7, '4.5MB', 'reconciliation_sheet.xlsx', 'xlsx'); 


