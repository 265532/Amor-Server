
# 开发规范指南

为保证代码质量、可维护性、安全性与可扩展性，请在开发过程中严格遵循以下规范。

## 一、项目环境信息

- **操作系统**：Windows 11  
- **工作目录**：`C:\Doc\Code\Java\Amor-Server`  
- **代码作者**：15113  
- **使用的 JDK 版本**：Java 21  
- **构建工具**：Maven  
- **框架版本**：
  - Spring Boot 2.7.10（父级依赖）
  - MyBatis Plus 3.5.3.1  
  - Lombok 1.18.30  

## 二、目录结构

```text
Amor-Server
└── src
    └── main
        ├── java
        │   └── com
        │       └── smartAmor
        │           ├── config
        │           ├── controllers
        │           ├── dto
        │           │   ├── request
        │           │   └── response
        │           ├── entity
        │           ├── mapper
        │           │   └── config
        │           ├── services
        │           │   └── interfaces
        │           ├── typeHandler
        │           └── utils
        └── resources
            └── mapper
```

## 三、分层架构规范

| 层级        | 职责说明                         | 开发约束与注意事项                                               |
|-------------|----------------------------------|----------------------------------------------------------------|
| **Controller** | 处理 HTTP 请求与响应，定义 API 接口 | 不得直接访问数据库，必须通过 Service 层调用                  |
| **Service**    | 实现业务逻辑、事务管理与数据校验   | 必须通过 Mapper 或 Repository 层访问数据库；返回 DTO 而非 Entity（除非必要） |
| **Mapper**     | 数据库访问与持久化操作             | 使用 MyBatis Plus 进行数据库交互；避免复杂 SQL，优先使用其提供的方法 |
| **Entity**     | 映射数据库表结构                   | 不得直接返回给前端（需转换为 DTO）；包名统一为 `entity`         |

### 接口与实现分离

- 所有接口实现类需放在接口所在包下的 `impl` 子包中。
- Service 层接口统一放置于 `services.interfaces` 包中，其实现类位于 `services.impl` 中。

## 四、安全与性能规范

### 输入校验

- 使用 `@Valid` 与 JSR-303 校验注解（如 `@NotBlank`, `@Size` 等）
  - 注意：Spring Boot 2.7.x 中校验注解位于 `jakarta.validation.constraints.*`

- 禁止手动拼接 SQL 字符串，防止 SQL 注入攻击。

### 事务管理

- `@Transactional` 注解仅用于 **Service 层**方法。
- 避免在循环中频繁提交事务，影响性能。

## 五、代码风格规范

### 命名规范

| 类型       | 命名方式             | 示例                  |
|------------|----------------------|-----------------------|
| 类名       | UpperCamelCase       | `UserServiceImpl`     |
| 方法/变量  | lowerCamelCase       | `saveUser()`          |
| 常量       | UPPER_SNAKE_CASE     | `MAX_LOGIN_ATTEMPTS`  |

### 注释规范

- 所有类、方法、字段需添加 **Javadoc** 注释。
- 所有注释采用中文（用户第一语言）。

### 类型命名规范（阿里巴巴风格）

| 后缀 | 用途说明                     | 示例         |
|------|------------------------------|--------------|
| DTO  | 数据传输对象                 | `UserDTO`    |
| DO   | 数据库实体对象               | `UserDO`     |
| BO   | 业务逻辑封装对象             | `UserBO`     |
| VO   | 视图展示对象                 | `UserVO`     |
| Query| 查询参数封装对象             | `UserQuery`  |

### 实体类简化工具

- 使用 Lombok 注解替代手动编写 getter/setter/构造方法：
  - `@Data`
  - `@NoArgsConstructor`
  - `@AllArgsConstructor`

## 六、扩展性与日志规范

### 接口优先原则

- 所有业务逻辑通过接口定义（如 `UserService`），具体实现放在 `impl` 包中（如 `UserServiceImpl`）。

### 日志记录

- 使用 `@Slf4j` 注解代替 `System.out.println`

## 七、其他通用规则

### 依赖管理

- 项目使用 Maven 构建，并通过 `<parent>` 引入 Spring Boot 父依赖，确保版本一致性。
- 使用 MyBatis Plus 进行数据库访问，提升开发效率。
- 使用 HikariCP 作为连接池，提升数据库连接性能。
- 所有依赖均在 `pom.xml` 中明确定义，避免隐式依赖。

### 配置文件说明

- 配置文件位于 `src/main/resources/application.properties`。
- 敏感信息如数据库密码和 API Key 通过环境变量注入。
- 数据源配置包含连接超时、最大连接数等优化项。
- MyBatis Plus 配置启用下划线转驼峰、SQL 日志打印等功能。

### 项目启动说明

- 使用 `mvn spring-boot:run` 启动项目。
- 开发阶段可启用 `spring-boot-devtools` 实现热部署功能。
