package com.javaweb.config;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.RentareaEntity;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "com.javaweb")
public class ModelMapperConfig {

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();

        // Ánh xạ tùy chỉnh từ RentareaEntity sang Integer
        modelMapper.addConverter(new Converter<RentareaEntity, Integer>() {
            public Integer convert(MappingContext<RentareaEntity, Integer> context) {
                return context.getSource() != null ? context.getSource().getValue() : null; // Lấy diện tích từ RentareaEntity
            }
        });
        modelMapper.addMappings(new PropertyMap<CustomerEntity, CustomerDTO>() {
            @Override
            protected void configure() {
                map().setName(source.getFullname());               // ánh xạ fullname sang name
                map().setCustomerPhone(source.getPhone());          // ánh xạ phone sang customerPhone
                map().setEmail(source.getEmail());                  // ánh xạ email sang email
                map().setDemand(source.getDemand());                // ánh xạ demand sang demand
                map().setStatus(source.getStatus());                // ánh xạ status sang status
                map().setCompanyName(source.getCompanyName());
            }

        });
        modelMapper.addMappings(new PropertyMap<CustomerDTO, CustomerEntity>() {
            @Override
            protected void configure() {
                map().setFullname(source.getName());
                map().setPhone(source.getCustomerPhone());
                map().setEmail(source.getEmail());
                map().setDemand(source.getDemand());
                map().setStatus(source.getStatus());
                map().setCompanyName(source.getCompanyName());

                // Nếu cần ánh xạ users thì viết thêm
            }
        });


        // Nếu cần, bạn có thể thêm các ánh xạ khác ở đây

        return modelMapper;
    }
}
