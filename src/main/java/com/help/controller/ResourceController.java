package com.help.controller;

import com.help.entity.Resource2;
import com.help.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ResourceController {

    @Resource
    private  ResourceService rService;
    //所有节点
    @RequestMapping("findAllResource.do")
    @ResponseBody
    public List<Resource2> findAllResource(){

        return rService.findAllResource();
    }
    @RequestMapping("findRs.do")
    @ResponseBody
    public List<Resource2> findRs(){
        return rService.findRs();
    }
    //删除资源
    @RequestMapping("removeResourceById.do")
    @ResponseBody
    public int removeResourceById(@RequestBody ArrayList<Integer> data){
        return rService.removeResourceById(data);
    }
    @RequestMapping("addRes.do")
    @ResponseBody
    public int addRes(Resource2 res){

        rService.addRes(res);
        return 1;
    }
    @RequestMapping("findFirstRes.do")
    @ResponseBody
    public List<Resource2> findFirstRes(){
        return rService.findFirstRes();
    }
    @RequestMapping("editRes.do")
    @ResponseBody
    public void editRes(Resource2 res){
        rService.editRes(res);
    }
    //分配权限
    @RequestMapping("fenpei.do")
    @ResponseBody
    public int fenpei(@RequestBody ArrayList<Map> data){
        System.out.println(data.get(0).get("rid"));
        return rService.fenpei(data);
    };
//    @Resource
//    private ResourceService rService;
//    //所有节点
//	/*@RequestMapping("findAllResource.do")
//	@ResponseBody
//	public List<Resource2> findAllResource(){
//		return rService.findAllResource();
//	}
//	//查找指定节点的子节点
//	@RequestMapping("findChild.do")
//	@ResponseBody
//	public List<Resource2> findChild(int id){
//
//		return rService.findChild(id);
//	}*/
//
//    //查询所有的资源管理
//    @RequestMapping("findRs.do")
//    @ResponseBody
//    public List<Resource2> findRs(int userid){
//
//        return rService.findRs(userid);
//
//
//
//    }
//
//
//    //添加子节点
//    @RequestMapping(value="saveRes.do",method= RequestMethod.POST)
//    public void saveRes(HttpServletRequest request, HttpServletResponse res){
//        String text = request.getParameter("text");
//        String url = request.getParameter("url");
//
//        String pid1 = request.getParameter("pid");
//
//        int pid = Integer.parseInt(pid1);
//
//        System.out.println(text+":text"+url+":url"+pid+":pid");
//        Resource2 resource2 = new Resource2();
//        resource2.setPid(pid);
//        resource2.setText(text);
//        resource2.setUrl(url);
//        rService.saveRes(resource2);
//
//
//    }
//    //删除子节点
//    @RequestMapping(value="removeRes.do",method= RequestMethod.POST)
//    @ResponseBody
//    public void removeRes(HttpServletRequest request, HttpServletResponse res){
//        String id = request.getParameter("id");
//        //System.out.println(id+"----------");
//        rService.removeRes(Integer.parseInt(id));
//    }
//
//
//    //分配权限
//    @RequestMapping(value="fenpei.do",method=RequestMethod.POST)
//    @ResponseBody
//    public int fenpei(@RequestBody ArrayList<Map> data){
//        //System.out.println(data.size()+"----");
//        for (Map map : data) {
//            System.out.println(map);
//        }
//        return rService.fenpei(data);
//
//    }
}
