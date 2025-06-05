package com.example.template.service.impl;

import com.example.template.service.DatabaseService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DatabaseServiceImpl implements DatabaseService {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional(readOnly = true)
    public boolean testConnection() {
        try {
            // Thực hiện một truy vấn đơn giản để kiểm tra kết nối
            entityManager.createNativeQuery("SELECT 1").getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public String getDatabaseInfo() {
        try {
            String productName = entityManager.createNativeQuery("SELECT version()").getSingleResult().toString();
            return "Database: " + productName;
        } catch (Exception e) {
            return "Không thể lấy thông tin database: " + e.getMessage();
        }
    }
} 