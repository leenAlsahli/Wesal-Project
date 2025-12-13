--Create Tables(Users, Departments, Employees, Customers)
-- 1. جدول الأقسام (يجب إنشاؤه أولاً لأن الموظف يتبع لقسم)
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 2. جدول المستخدمين (السوبر كلاس - يحتوي على البيانات المشتركة)
CREATE TABLE users (
    -- الهوية الوطنية الآن هي المفتاح الأساسي (PRIMARY KEY)
    user_id VARCHAR(10) PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    -- شرط للتحقق
    CHECK (
        LENGTH(user_id) = 10 
        AND user_id ~ '^[0-9]+$'
    )
);

--3. جدول هواتف المستخدمين (multi value)
CREATE TABLE user_phone (
    u_id VARCHAR(10) REFERENCES users(user_id) ON DELETE CASCADE , 
    phone_number VARCHAR(20) ,
    PRIMARY KEY (u_id, phone_number)
);

-- 4. جدول الموظفين (يرث من المستخدمين ويرتبط بقسم)
CREATE TABLE employees (
    user_id VARCHAR(10) PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE, 
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    dept_id INT REFERENCES departments(dept_id) ON DELETE SET NULL
);

-- 4. جدول العملاء (يرث من المستخدمين)
CREATE TABLE customers (
    user_id VARCHAR(10) PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
    customer_type VARCHAR(50), -- مثلًا: فرد، شركة
    organization_name VARCHAR(100)
);

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


