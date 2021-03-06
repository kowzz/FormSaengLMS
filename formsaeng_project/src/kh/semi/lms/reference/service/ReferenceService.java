package kh.semi.lms.reference.service;

import static kh.semi.lms.common.jdbc.JdbcDbcp.close;


import static kh.semi.lms.common.jdbc.JdbcDbcp.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.lms.asg.model.dao.AsgListDao;
import kh.semi.lms.asg.model.vo.AsgListVo;
import kh.semi.lms.reference.dao.ReferenceDao;
import kh.semi.lms.reference.vo.ReferenceVo;



public class ReferenceService {
	public ArrayList<ReferenceVo> referenceboardlist(){
		
		ArrayList<ReferenceVo> result = null;
		Connection conn = getConnection();
		
		result = new ReferenceDao().referenceBoardlist(conn);
		
		close(conn);
		
		return result;
	}
	public int insertReferenceBoard(ReferenceVo vo, String name, String subjectCode) {
		Connection conn =getConnection();
		int result = new ReferenceDao().referenceinsertBoard(conn, vo, name, subjectCode);
		close(conn);
		return result;
	}
	public int deleteReferenceBoard(int[] delist) {
		Connection conn=getConnection();
		int cnt =new ReferenceDao().refdeleteBoard(conn, delist);
		close(conn);
		return cnt;
	}
	public ReferenceVo detailReferenceBoardView(int lbAno) {
		Connection conn = getConnection();
		ReferenceVo vo = new ReferenceDao().detailBoard(conn, lbAno);
		close(conn);
		return vo;
	}
	public int multiDeleteBoard(String[] refdelno,String subCode) {
	Connection conn = getConnection();
	int result = new ReferenceDao().multeDelet(conn, refdelno, subCode);
	close(conn);
	return result;
}
	public int countListBoard() {
		Connection conn = getConnection();
		int result = new ReferenceDao().countListBoard(conn);
		close(conn);
		return result;
	}
	public ArrayList<ReferenceVo> referenceBoardlist(int startRnum,int endRnum, String subcode) {
		Connection conn = getConnection();
		ArrayList<ReferenceVo> volist = new ReferenceDao().referenceBoardlist(conn, startRnum, endRnum, subcode);
		close(conn);
		return volist;
	}

}
