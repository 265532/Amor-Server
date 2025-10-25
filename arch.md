# SmartAgriculture-Server 架构文档

## 1. 项目概述
SmartAgriculture-Server 是一个基于 Spring Boot 的 Web 应用，目前功能较为基础，仅包含一个简单的 REST 接口。

## 2. 技术栈
- **框架**: Spring Boot 2.7.10
- **语言**: Java 8
- **构建工具**: Maven
- **主要依赖**: `spring-boot-starter-web`

## 3. 模块划分
### 3.1 核心模块
- **入口类**: `App.java`
  - 提供 `/` 路径的 REST 接口，返回 `"Hello World!"`。

### 3.2 控制器模块
- 目前 `controllers` 目录为空，未来可以在此目录下添加更多控制器类。

## 4. 依赖关系
- 项目依赖 Spring Boot 提供的 Web 功能。

## 5. 未来扩展建议
1. **功能扩展**: 添加更多 REST 接口，支持农业相关的业务逻辑。
2. **模块化**: 根据业务需求，将功能拆分为多个模块（如用户管理、设备管理等）。
3. **数据库集成**: 引入数据库（如 MySQL 或 PostgreSQL）存储数据。
4. **安全性**: 添加认证和授权机制（如 Spring Security）。