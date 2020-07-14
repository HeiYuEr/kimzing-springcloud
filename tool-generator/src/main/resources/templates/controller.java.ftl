package ${package.Controller};


import org.springframework.web.bind.annotation.*;
import org.apache.dubbo.config.annotation.Reference;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.kimzing.web.resolver.json.JsonParam;
import com.kimzing.utils.page.PageParam;
import com.kimzing.utils.page.PageResult;
import ${package.Service}.${table.serviceName};
import ${package.Entity}.*;

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * ${table.comment!}接口层.
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@Api(tags = "${table.comment!}")
@RestController
<#else>
@Controller
</#if>
<#--@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")-->
@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/${package.ModuleName}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    @Reference
    ${table.serviceName} ${table.serviceName?uncap_first};

    @ApiOperation(value = "保存${table.comment!}")
    @PostMapping
    public ${table.name?cap_first}BO save(@RequestBody ${table.name?cap_first}SaveDTO ${table.name}SaveDTO) {
        return ${table.serviceName?uncap_first}.save(${table.name}SaveDTO);
    }

    @ApiOperation(value = "移除${table.comment!}")
    @DeleteMapping("/{id}")
    public void remove(@PathVariable("id") Integer id) {
        ${table.serviceName?uncap_first}.remove(id);
    }

    @ApiOperation(value = "更新${table.comment!}")
    @PutMapping
    public void update(@RequestBody ${table.name?cap_first}UpdateDTO ${table.name}UpdateDTO) {
        ${table.serviceName?uncap_first}.update(${table.name}UpdateDTO);
    }

    @ApiOperation(value = "查询单个${table.comment!}")
    @GetMapping("/{id}")
    public ${table.name?cap_first}BO get(@PathVariable("id") Integer id) {
        return ${table.serviceName?uncap_first}.get(id);
    }

    @ApiOperation(value = "分页条件查询${table.comment!}")
    @GetMapping("/list")
    public PageResult<${table.name?cap_first}BO> listPage(@JsonParam ${table.name?cap_first}QueryDTO ${table.name}QueryDTO, @ModelAttribute PageParam pageParam) {
        return ${table.serviceName?uncap_first}.listPage(${table.name}QueryDTO, pageParam);
    }

}
</#if>
