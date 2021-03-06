package kh.semi.notice.model.vo;

public class NoticeVo {
	private int boardNoticeNo; // 공지사항 번호
	private String boardNoticeTitle; // 공지사항 제목
	private String boardNoticeContent; // 공지사항 내용
	private String boardNoticeWriter; // 공지사항 작성자
	private String boardNoticeDate; // 공지사항 작성일자
	private String id; // 작성자 아이디
	
	private String rn;



	@Override
	public String toString() {
		return "NoticeVo [boardNoticeNo=" + boardNoticeNo + ", boardNoticeTitle=" + boardNoticeTitle
				+ ", boardNoticeContent=" + boardNoticeContent + ", boardNoticeWriter=" + boardNoticeWriter
				+ ", boardNoticeDate=" + boardNoticeDate + ", id=" + id + ", rn=" + rn + "]";
	}

	public int getBoardNoticeNo() {
		return boardNoticeNo;
	}

	public void setBoardNoticeNo(int boardNoticeNo) {
		this.boardNoticeNo = boardNoticeNo;
	}

	public String getBoardNoticeTitle() {
		return boardNoticeTitle;
	}

	public void setBoardNoticeTitle(String boardNoticeTitle) {
		this.boardNoticeTitle = boardNoticeTitle;
	}

	public String getBoardNoticeContent() {
		return boardNoticeContent;
	}

	public void setBoardNoticeContent(String boardNoticeContent) {
		this.boardNoticeContent = boardNoticeContent;
	}

	public String getBoardNoticeWriter() {
		return boardNoticeWriter;
	}

	public void setBoardNoticeWriter(String boardNoticeWriter) {
		this.boardNoticeWriter = boardNoticeWriter;
	}

	public String getBoardNoticeDate() {
		return boardNoticeDate;
	}

	public void setBoardNoticeDate(String boardNoticeDate) {
		this.boardNoticeDate = boardNoticeDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

}
