package com.vanhieu.dto;

import com.vanhieu.dto.AbstractDTO;

public class CommentDTO extends AbstractDTO<CommentDTO> {

		private String content;
		private Long user_id;
		private Long new_id;
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Long getUser_id() {
			return user_id;
		}
		public void setUser_id(Long user_id) {
			this.user_id = user_id;
		}
		public Long getNew_id() {
			return new_id;
		}
		public void setNew_id(Long new_id) {
			this.new_id = new_id;
		}
		
		
}
/*
 * content TEXT NOT NULL, user_id bigint NOT NULL, new_id bigint NOT NULL,
 */
