package com.controller.servlet;

import com.model.KlKnowledge;
import com.utils.IDUtils;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 合并分块
 *
 *
 */
public class VideoPoint extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = request.getServletContext().getRealPath("/")+"attached/vedio/";
		String saveUrl  = request.getContextPath() + "/attached/vedio/";
		HttpSession session = request.getSession();

		String folad = "vedioFile";
		savePath = savePath  + folad + "/";
		saveUrl = saveUrl + folad + "/";
		String action = request.getParameter("action");

		if (action.equals("mergeChunks")) {
			// 合并文件
			// 需要合并的文件的目录标记
			String fileMd5 = request.getParameter("fileMd5");
			String fileSuffix=request.getParameter("fileSuffix");

			// 读取目录里的所有文件
			File f = new File(savePath  + fileMd5);
			File[] fileArray = f.listFiles(new FileFilter() {
				// 排除目录只要文件
				public boolean accept(File pathname) {
					if (pathname.isDirectory()) {
						return false;
					}
					return true;
				}
			});

			// 转成集合，便于排序
			List<File> fileList = new ArrayList<File>(Arrays.asList(fileArray));
			Collections.sort(fileList, new Comparator<File>() {
				public int compare(File o1, File o2) {
					if (Integer.parseInt(o1.getName()) < Integer.parseInt(o2
							.getName())) {
						return -1;
					}
					return 1;
				}
			});
			// UUID.randomUUID().toString()-->随机名
			File outputFile = new File(savePath + fileMd5 + "."+fileSuffix);
			saveUrl = saveUrl + fileMd5 + "." + fileSuffix;
			// 创建文件
			outputFile.createNewFile();
			// 输出流
			FileChannel outChnnel = new FileOutputStream(outputFile).getChannel();
			// 合并
			FileChannel inChannel;
			for (File file : fileList) {
				inChannel = new FileInputStream(file).getChannel();
				inChannel.transferTo(0, inChannel.size(), outChnnel);
				inChannel.close();
				// 删除分片
				file.delete();
			}
			outChnnel.close();
			// 清除文件夹
			File tempFile = new File(savePath + fileMd5);
			if (tempFile.isDirectory() && tempFile.exists()) {
				tempFile.delete();
			}
			System.out.println("合并成功");

			//保存路径
			String url = saveUrl;
			if (session.getAttribute("KlId") != null) {
				// 不是第一次
				String urls = (String) session.getAttribute("urls");
				if (url != null) {
					urls += "," + url;
				}
				session.setAttribute("urls", urls);
			} else {
				//第一个文件
				Integer KlId = IDUtils.genIntegerId();
				session.setAttribute("KlId", KlId);
				session.setAttribute("urls", url);
			}

			/*Integer KlId = IDUtils.genIntegerId();
			String name = new String(request.getParameter("name").getBytes("UTF-8"),"UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			//拼接json数据
			String jsonStr = "{\"KlId\":\""+KlId+"\",\"age\":\"20\"}";
			//将数据写入流中
			response.getWriter().write(jsonStr);*/
		} else if (action.equals("checkChunk")) {
			// 检查当前分块是否上传成功
			String fileMd5 = request.getParameter("fileMd5");
			String chunk = request.getParameter("chunk");
			String chunkSize = request.getParameter("chunkSize");

			File checkFile = new File(savePath + fileMd5 + "/" + chunk);

			response.setContentType("text/html;charset=utf-8");
			// 检查文件是否存在，且大小是否一致
			if (checkFile.exists()
					&& checkFile.length() == Integer.parseInt(chunkSize)) {
				// 上传过
				response.getWriter().write("{\"ifExist\":1}");
			} else {
				// 没有上传过
				response.getWriter().write("{\"ifExist\":0}");
			}
		}
	}

}
