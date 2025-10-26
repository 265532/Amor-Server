package com.smartagriculture.services.amorphous.alloysService;

import com.smartagriculture.model.amorphous.alloys.AmorphousAlloys;
import com.smartagriculture.model.amorphous.alloys.AmorphousAlloysRepository;
import com.smartagriculture.model.amorphous.alloys.Properties;
import com.smartagriculture.model.base.types.BaseTypesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AmorphousAlloysServiceImpl implements AmorphousAlloysService {
    // 将容器里的 InfoRepository的实例赋值给这个字段
    @Autowired
    private AmorphousAlloysRepository amorphousAlloysRepository;

    @Autowired
    private BaseTypesRepository baseTypesRepository; // 新增

    @Override
    public AmorphousAlloys getInfoById(String id) {
        return amorphousAlloysRepository.findById(id).orElse(null);
    }

    @Override
    public List<AmorphousAlloys> findAll() {
        return amorphousAlloysRepository.findAll();
    }

    @Override
    public AmorphousAlloys create(AmorphousAlloys amorphousAlloys) {
        // 验证基体类型是否存在
        int baseTypeId = amorphousAlloys.getBaseTypeId();
        if (!baseTypesRepository.existsById(baseTypeId)) {
            throw new IllegalArgumentException("无效的基体类型ID: " + baseTypeId);
        }
        // 验证必填字段
        if (amorphousAlloys.getProperties() == null) {
            throw new IllegalArgumentException("Properties cannot be null");
        }

        // 验证属性值
        Properties props = amorphousAlloys.getProperties();
        if (props.getHardness() <= 0 ||
                props.getStrength() <= 0 ||
                props.getCorrosion_resistance() <= 0) {
            throw new IllegalArgumentException("Property values must be positive");
        }

        amorphousAlloys.setCreatedAt(LocalDateTime.now());
        amorphousAlloys.setUpdatedAt(LocalDateTime.now());

        return amorphousAlloysRepository.save(amorphousAlloys);
    }

    @Override
    public AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys) {
        String Id = amorphousAlloys.getId();
        if (!amorphousAlloysRepository.existsById(Id)) throw new IllegalArgumentException("无效的ID: " + Id);
        amorphousAlloys.setCreatedAt(amorphousAlloysRepository.findById(Id).get().getCreatedAt());
        amorphousAlloys.setUpdatedAt(LocalDateTime.now());
        return amorphousAlloysRepository.save(amorphousAlloys);
    }

    @Override
    public void deleteById(String id) {
        amorphousAlloysRepository.deleteById(id);
    }
}
