package mchti.service;

import mchti.model.sample.ZxEmp;
import mchti.exception.ZxEmpNotFoundException;
import mchti.dto._SearchDTO;
import java.math.BigInteger;
import java.util.List;

public interface ZxEmpService {

    public ZxEmp findByCode(String code);

    public ZxEmp findById(BigInteger id);
    
    public ZxEmp create(ZxEmp zxEmp);
    
    public ZxEmp update(ZxEmp zxEmp) throws ZxEmpNotFoundException;
    
    public ZxEmp copy(ZxEmp zxEmp);
    
    public ZxEmp delete(BigInteger id) throws ZxEmpNotFoundException;
   
    public List<ZxEmp> search(_SearchDTO pageable);
    
    public List<ZxEmp> findAll(_SearchDTO pageable);
    
    public List<ZxEmp> findAll();
}