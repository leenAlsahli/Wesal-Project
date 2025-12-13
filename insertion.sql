-- إضافة أقسام
INSERT INTO departments (name, description) VALUES
('IT Support', 'Handles technical issues and tickets'),
('Sales', 'Handles customer subscriptions and sales'),
('HR', 'Human resources and employee management');

-- إضافة مستخدمين (يتم إضافتهم هنا أولاً ليحصلوا على ID)
INSERT INTO users (user_id, first_name, last_name, email, phone) VALUES
('1011234567', 'Norah', 'Helal', 'norahaldakheel1441@gmail.com', '0504709942'), -- الموظفة 1
('1019876543', 'Lama', 'Saleh', 'lamaSaleh@gmail.com', '0501234567'),          -- الموظفة 2
('1234567890', 'Thmanyah', 'Company', 'contact1@thmanyah.com', '0112223333'), -- العميل 3 (شركة)
('1015555555', 'John', 'Doe', 'john1@gmail.com', '0555555555');  -- العميل 4

-- تصنيف المستخدمين: إضافة بياناتهم في الجداول الفرعية

-- 1. الموظفين (نربطهم بالأقسام)
-- نورة موظفة في قسم IT (رقم القسم 1)
INSERT INTO employees (user_id, job_title, salary, dept_id) VALUES
('1011234567', 'Senior Technician', 25000.00, 1),
-- لمى موظفة في قسم HR (رقم القسم 3)
('1019876543', 'HR Specialist', 12000.00, 3);

-- 2. العملاء
--  عميل شركة ثمانية
INSERT INTO customers (user_id, customer_type, organization_name) VALUES
('1234567890', 'Organization', 'Thmanyah');

-- John Doe عميل فرد
INSERT INTO customers (user_id, customer_type, organization_name) VALUES
('1015555555', 'Individual', NULL);




--  support agents اضافة
Insert into support_agent (sagent_id,f_name, l_name, email, role, skills, dept_id) Values
( '1101552135','Leen' , 'AlSahli' ,'Leenfahadals@gmail.com','Head of Strategic Solutions','Designing Complex Systems' , 1),
('1160265172' ,'Reema' , 'AlAli' ,'ReemaAl@gmail.com','Technical Solutions Manager','Infrastructure Project Management' , 1),
( '1170265134' ,'Sara' , 'Abdullah' ,'SaraAbdullah1@gmail.com','HR Assistant','HRIS Management' , 3);

--اضافة ارقام هواتف الوكلاء
Insert into  support_agent_phone (phone, sagent_id) VALUES
('0509209585', '1101552135'), --  هاتف لين
('0541001000', '1160265172'), -- هاتف ريما
('0541001001', '1160265172'), -- هاتف ريما الاخر
('0562002000',  '1170265134'); -- هاتف سارة

--اضافة التذاكر
Insert into ticket (title, description, status, priority, creation_date, resloution_date, sagent_id, dept_id, user_id) VALUES
-- Ticket 1 :  itعيننا تذكرة نورة الى لين في قسم الـ 
('New Office Network Expansion Project', 'Design and plan the infrastructure setup for 30 new employees.', 'open', 'urgent', '2025-12-05', NULL, '1101552135', 1, '1011234567'), 

-- ticket2 :  itعيننا تذكرة شركة ثمانيه الى ريما في قسم الـ 
('Sales Main Server Downtime', 'Access to the main sales database is currently impossible, requires senior technical intervention.', 'in progress', 'high', '2025-12-04', NULL, '1160265172', 1,'1234567890'),

-- Ticket 3 :  hr عيننا تذكرة لمى الى ساره في قسم الـ 
('Medical Insurance Policy Amendment', 'Request to upgrade the insurance category for my dependent.', 'open', 'medium', '2025-12-01', NULL, '1170265134', 3, '1019876543'),

-- ticket 4:  sales & subscriptions لم يتم تعيين تذكرة جون لوكيل الى الان ، وهي تتبع لقسم الـ 
('Customer Invoice Dispute', 'Customer claims there is an error in the invoiced amount.', 'open', 'low', '2025-12-06', NULL, NULL, 2, '1015555555');

-- INSERTION (FEEDBACK , ATTACHMENT)
INSERT INTO Feedback(comment,u_id,rating) VALUES 
('Great service !','1011234567',3),-- كومنت التكت مع اليوزر اي دي لصاحب التكت
('Problem happened again','1019876543',4),
('Agent assigned was friendly','1015555555',5);



INSERT INTO Attachment(T_id,file_size,file_name,file_type) VALUES
(1,'2MB','error.png','png'),
(2,'200KB','info.txt','text'),
(3,'9.8MB','report.pdf','pdf');


--
