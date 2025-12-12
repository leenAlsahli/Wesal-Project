
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
    phone VARCHAR(20),
    contact_info TEXT,
    
    -- شرط للتحقق
    CHECK (
        LENGTH(user_id) = 10 
        AND user_id ~ '^[0-9]+$'
    )
);
-- 3. جدول الموظفين (يرث من المستخدمين ويرتبط بقسم)
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

--5. (departments يرتبط بجدول ) support agent جدول      
create table support_agent (
  sagent_id VARCHAR(10) primary key,
  f_name varchar(50)  Not null,
  l_name varchar(50) Not null,
  email varchar(100) UNIQUE Not null,
  role  varchar(50), -- دوره ، مثلا : فني ، مهندس دعم
  skills varchar(300) , 
  dept_id  INT  Not null references departments(dept_id)
   -- support agentالذي ينتمي اليه الـdepartmentللـforeign key
   --شرط للتخقق
       CHECK (
        LENGTH(sagent_id) = 10 
        AND sagent_id ~ '^[0-9]+$'
    )
);
--6. ( يخزن رقم هاتف او اكثر  ) support agentجدول ارقام هواتف الـ 
create table support_agent_phone (
  phone varchar(20) primary key ,
sagent_id VARCHAR(10) REFERENCES support_agent(sagent_id) ON DELETE CASCADE
    -- Support Agent عند حذف الـ phoneلنضمن حذف الـ
);

--7. ticketجدول الـ 
create table ticket( 
  ticket_id  SERIAL primary key ,
  title Varchar(100)   NOT NULL ,
  description text,
  status Varchar(20) Check (status in ('open', 'in progress', 'closed')) ,
    --للتاكد من ان حالة التذكرة محصوره على هذه الثلاث حالات  
  priority  Varchar(20) Check (priority in ('low', 'medium', 'high', 'urgent')),
    --للتاكد من ان اولوية التذكرة محصورة على هذه الاربع حالات  
  creation_date   Date Not null,
  resloution_date Date,
sagent_id VARCHAR(10) references support_agent(sagent_id),
       -- للوكيل المسؤول عن التذكرة foreign key 
       user_id VARCHAR(10) references users(user_id),
   -- لليوزر الذي انشئ التذكرة foreign key 
  dept_id Int Not null references departments(dept_id)
  -- للقسم المسؤول عن التذكرة foreign key 

); 

CREATE TABLE Feedback(-- جدول الفيدباك 
  f_id SERIAL PRIMARY KEY,
  rating INT CHECK (rating BETWEEN 1 AND 5), 
  comment VARCHAR(300),
  u_id VARCHAR(10),
  FOREIGN KEY (u_id) references USERS(user_id) ON DELETE SET NULL ON UPDATE CASCADE 
);

CREATE TABLE Attachment ( -- جدول المرفقات
  A_id SERIAL PRIMARY KEY,
  T_id INT ,
  file_size VARCHAR(10), 
  file_name VARCHAR(50),
  file_type VARCHAR(20),
  FOREIGN KEY (T_id) REFERENCES ticket(ticket_id)
  ON DELETE CASCADE -- لو انحذفت التكت تنحذف المرفقات معها
  ON UPDATE CASCADE
);

