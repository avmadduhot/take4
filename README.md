# Product Management Application

A Spring Boot web application for managing products with CRUD operations, designed for deployment on Azure Web App Service with Azure SQL Database.

## 🚀 Quick Start - Deploy to Azure

### Prerequisites
- Azure account with Azure SQL Database service
- GitHub account
- Existing Azure SQL Database named `SampleDB`

### Features
- **Web Interface**: Simple, responsive UI for managing products
- **REST API**: RESTful endpoints for programmatic access
- **Database Operations**: Create, Read, Update, Delete operations for products
- **Azure Integration**: Configured for Azure Web App Service and Azure SQL Database
- **Responsive Design**: Bootstrap-based UI that works on desktop and mobile

## Technology Stack

- **Framework**: Spring Boot 3.2.1
- **Language**: Java 17
- **Database**: Azure SQL Database (SQL Server)
- **Frontend**: Thymeleaf templates with Bootstrap 5
- **Build Tool**: Maven
- **Deployment**: Azure Web App Service

## Project Structure

```
src/
├── main/
│   ├── java/com/azure/productmanagement/
│   │   ├── ProductManagementApplication.java  # Main application class
│   │   ├── controller/
│   │   │   ├── ProductRestController.java     # REST API endpoints
│   │   │   └── ProductWebController.java      # Web UI controllers
│   │   ├── model/
│   │   │   └── Product.java                   # Product entity
│   │   └── repository/
│   │       └── ProductRepository.java         # Data access layer
│   └── resources/
│       ├── templates/                         # Thymeleaf templates
│       │   ├── index.html                     # Product list page
│       │   ├── add-product.html               # Add product form
│       │   └── edit-product.html              # Edit product form
│       ├── application.properties             # Production config
│       ├── application-local.properties       # Local development config
│       └── data.sql                          # Database initialization
```

## Database Schema

The application automatically creates the following table in your Azure SQL Database:

```sql
CREATE TABLE products (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL
);
```

## 📋 Step-by-Step Azure Deployment Instructions

### Step 1: Push Code to GitHub Repository

1. **Initialize Git Repository** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Product Management App"
   ```

2. **Create GitHub Repository**:
   - Go to [GitHub](https://github.com)
   - Click "New repository"
   - Name it (e.g., `product-management-app`)
   - Keep it public or private (your choice)
   - Click "Create repository"

3. **Push Your Code**:
   ```bash
   git remote add origin https://github.com/yourusername/your-repo-name.git
   git branch -M main
   git push -u origin main
   ```

### Step 2: Create Azure Web App Service

1. **Navigate to Azure Portal**:
   - Go to [Azure Portal](https://portal.azure.com)
   - Click "Create a resource"
   - Search for "Web App" and select it

2. **Configure Web App**:
   - **Subscription**: Choose your subscription
   - **Resource Group**: Create new or use existing
   - **Name**: `product-management-app` (or your preferred name)
   - **Publish**: Code
   - **Runtime stack**: Java 17
   - **Java web server stack**: Java SE (Embedded Web Server)
   - **Operating System**: Linux
   - **Region**: Same region as your SQL Database (for better performance)
   - **Pricing Plan**: Choose based on your needs (Basic B1 is sufficient for testing)

3. **Review and Create**:
   - Click "Review + create"
   - Click "Create"
   - Wait for deployment to complete (2-3 minutes)

### Step 3: Configure Database Connection

1. **Navigate to Web App Configuration**:
   - Go to your newly created Web App
   - In the left menu, click "Configuration"
   - Click "Application settings" tab

2. **Add Environment Variables**:
   Click "New application setting" for each of the following:

   | Name | Value | Example |
   |------|--------|---------|
   | `AZURE_SQL_SERVER` | `your-server-name.database.windows.net` | `myserver.database.windows.net` |
   | `AZURE_SQL_DATABASE` | `SampleDB` | `SampleDB` |
   | `AZURE_SQL_USERNAME` | `your-database-username` | `sqladmin` |
   | `AZURE_SQL_PASSWORD` | `your-database-password` | `YourPassword123!` |

   > **Note**: Replace the example values with your actual Azure SQL Database details

3. **Save Configuration**:
   - Click "Save" at the top
   - Click "Continue" when prompted

### Step 4: Deploy from GitHub

1. **Access Deployment Center**:
   - In your Web App, click "Deployment Center" in the left menu

2. **Configure Source**:
   - **Source**: Select "GitHub"
   - Click "Authorize" and sign in to your GitHub account
   - Grant Azure access to your repositories

3. **Select Repository**:
   - **Organization**: Your GitHub username
   - **Repository**: Select your repository (e.g., `product-management-app`)
   - **Branch**: `main` (or your default branch)

4. **Configure Build**:
   - **Build provider**: "App Service build service" (recommended)
   - This will automatically detect your Maven project

5. **Save and Deploy**:
   - Click "Save"
   - Azure will start the initial deployment (this takes 5-10 minutes)
   - You can monitor progress in the "Logs" tab

### Step 5: Verify Deployment

1. **Check Deployment Status**:
   - Stay on the "Deployment Center" page
   - Watch the deployment logs until you see "Deployment successful"

2. **Test Database Connection**:
   - Go to your Web App "Overview" page
   - Note the URL (e.g., `https://product-management-app.azurewebsites.net`)

## 🌐 Accessing Your Application

Once deployment is complete, your application will be available at these URLs:

### Web Interface
**Main URL**: `https://your-app-name.azurewebsites.net/`

Available pages:
- **Home Page** (`/`): View all products, add/edit/delete products
- **Add Product** (`/add`): Form to create new products  
- **Edit Product** (`/edit/{id}`): Form to modify existing products

### REST API Endpoints
**Base URL**: `https://your-app-name.azurewebsites.net/api/products`

| Method | Endpoint | Description | Example |
|--------|----------|-------------|---------|
| GET | `/api/products` | Get all products | Returns JSON array of products |
| GET | `/api/products/{id}` | Get product by ID | Returns single product JSON |
| POST | `/api/products` | Create new product | Send JSON: `{"productName":"Test","productPrice":29.99}` |
| PUT | `/api/products/{id}` | Update product | Send JSON with updated data |
| DELETE | `/api/products/{id}` | Delete product | Returns success/error status |

### Example API Usage

**Get all products**:
```bash
curl https://your-app-name.azurewebsites.net/api/products
```

**Create a product**:
```bash
curl -X POST https://your-app-name.azurewebsites.net/api/products \
  -H "Content-Type: application/json" \
  -d '{"productName":"New Product","productPrice":99.99}'
```

## 🎯 Features Ready to Test

Once deployed, you can immediately test these features:

1. **Product List View**: 
   - Navigate to your app URL to see all products
   - Sample data will be automatically loaded on first run

2. **Add New Product**: 
   - Click "Add New Product" button
   - Fill in product name and price
   - Submit to create

3. **Edit Existing Product**: 
   - Click "Edit" button next to any product
   - Modify details and save

4. **Delete Product**: 
   - Click "Delete" button (with confirmation dialog)

5. **REST API Testing**: 
   - Use tools like Postman, curl, or browser
   - Test all CRUD operations via API endpoints

## 🗃️ Database Schema

The application automatically creates this table in your Azure SQL Database:

```sql
CREATE TABLE products (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL
);
```

**Sample data** is inserted automatically on first run:
- Sample Product 1 - $29.99
- Sample Product 2 - $49.99  
- Sample Product 3 - $99.99

## 🔧 Local Development (Optional)

If you want to run locally for development:

1. **Prerequisites**: Java 17, Maven
2. **Configure Local Database**: Update `application-local.properties`
3. **Run**: `mvn spring-boot:run -Dspring-boot.run.profiles=local`
4. **Access**: http://localhost:8080

## 🛠️ Troubleshooting

### Common Issues and Solutions

**Issue**: Application won't start
- **Check**: Application settings in Azure Web App Configuration
- **Verify**: All environment variables are set correctly
- **Solution**: Ensure `AZURE_SQL_SERVER`, `AZURE_SQL_DATABASE`, `AZURE_SQL_USERNAME`, `AZURE_SQL_PASSWORD` are configured

**Issue**: Database connection fails
- **Check**: Azure SQL Database firewall settings
- **Solution**: Go to Azure SQL Database → Firewalls and virtual networks → Allow Azure services and resources to access this server: **ON**

**Issue**: Build fails during deployment  
- **Check**: Deployment logs in Azure Portal → Your Web App → Deployment Center → Logs
- **Common cause**: Java version mismatch
- **Solution**: Ensure Web App is configured for Java 17

**Issue**: 404 errors on API endpoints
- **Wait**: Initial deployment can take 5-10 minutes
- **Check**: Application logs in Azure Portal → Your Web App → Log stream
- **Restart**: Try restarting the Web App if needed

### Monitoring Your Application

1. **Application Logs**:
   - Azure Portal → Your Web App → Log stream
   - Real-time application logs and errors

2. **Deployment Logs**:
   - Azure Portal → Your Web App → Deployment Center → Logs
   - Build and deployment history

3. **Metrics**:
   - Azure Portal → Your Web App → Metrics
   - Performance monitoring and usage statistics

## 📁 Project Structure

```
src/
├── main/
│   ├── java/com/azure/productmanagement/
│   │   ├── ProductManagementApplication.java  # Main application class
│   │   ├── controller/
│   │   │   ├── ProductRestController.java     # REST API endpoints
│   │   │   └── ProductWebController.java      # Web UI controllers
│   │   ├── model/
│   │   │   └── Product.java                   # Product entity
│   │   └── repository/
│   │       └── ProductRepository.java         # Data access layer
│   └── resources/
│       ├── templates/                         # Thymeleaf templates
│       │   ├── index.html                     # Product list page
│       │   ├── add-product.html               # Add product form
│       │   └── edit-product.html              # Edit product form
│       ├── application.properties             # Production config
│       ├── application-local.properties       # Local development config
│       └── data.sql                          # Database initialization
├── pom.xml                                    # Maven configuration
├── azure-app-settings.env                    # Environment variables reference
└── README.md                                 # This file
```

## 🔗 Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Azure Web App Service Documentation](https://docs.microsoft.com/en-us/azure/app-service/)
- [Azure SQL Database Documentation](https://docs.microsoft.com/en-us/azure/azure-sql/database/)
- [Thymeleaf Documentation](https://www.thymeleaf.org/documentation.html)

---

**🎉 Congratulations!** Your Product Management Application is now ready for deployment to Azure. Follow the step-by-step instructions above to get it running in the cloud.
