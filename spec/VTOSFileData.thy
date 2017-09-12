theory VTOSFileData
imports Main  "~~/src/HOL/Word/Word"
begin

type_synonym 'a word = "'a  word"
type_synonym  word8 =  "8 word"
type_synonym word16 = "16 word"
type_synonym word32 = "32 word"
type_synonym word64 = "64 word"
(*type_synonym uint32 = "32 uints"*)

record inode =
  i_mode       ::   word16 (*unsigned short *)
  i_nlinks     ::   word16
  i_uid        ::   word16
  i_gid        ::   word8
  i_size       ::   word32
  i_atime      ::   word32
  i_mtime      ::   word32
  i_ctime      ::   word32                                             
  (*zone_t i_zone[V2_NR_TZONES]*)
  i_dev        ::   word16
  i_num        ::   word32
  
  
record super_block =
  s_nzones           ::   word32
  s_imap_blocks      ::   word32
  s_zmap_blocks      ::   word32
  s_firstdatazone    ::   word32
  s_log_zone_size    ::   word32
  s_pad              ::   word32
  s_max_size         ::   word32
  s_zones            ::   word32
  s_magic            ::   word32
  s_pad2             ::   word32
  s_block_size       ::   word32
  s_disk_version     ::   word32
  s_isup             ::   word32
  s_imount           ::   word32
  s_inodes_per_block ::   word32
  s_dev              ::   word32
  s_rd_only          ::   word32
  s_native           ::   word32
  s_version          ::   word32
  s_ndzones          ::   word32
  s_nindirs          ::   word32
  s_isearch          ::   word32
  s_zsearch          ::   word32
  
record fproc =
  fp_umask               ::  word32     
  fp_workdir             ::  word32
  fp_rootdir             ::  word32
  (*fp_filp[OPEN_MAX]      ::  word32*)
  fp_realuid             ::  word32
  fp_effuid              ::  word32
  fp_realgid             ::  word32
  fp_effgid              ::  word32
  fp_tty                 ::  word32
  fp_fd                  ::  word32
  fp_buffer              ::  word32
  fp_nbytes              ::  word32
  fp_cum_io_partial      ::  word32
  fp_suspended           ::  word32
  fp_revived             ::  word32
  fp_task                ::  word32
  fp_sesldr              ::  word32
  fp_pid                 ::  word32
  fp_cloexec             ::  word32
    
record filp =
  filp_mode              ::  word32
  filp_flags             ::  word32
  filp_count             ::  word32
  filp_ino               ::  word32
  filp_pos               ::  word32
  filp_selectors         ::  word32
  filp_select_ops        ::  word32
  filp_pipe_select_ops   ::  word32
  
record buf =
  b_next	    :: word32
  b_prev	    :: word32
  b_hash	    :: word32
  b_blocknr   :: word32
  b_dev       :: word32
  b_dirt	    :: word32
  b_count     :: word32
  
 
datatype mem_superblock_list =  nil | super_block
    
datatype mem_inode_list = nil|inode

datatype mem_buf_list = nil|buf

record state =
  super_block  :: mem_superblock_list
  inode_array  :: mem_inode_list
  buffer_array :: mem_buf_list

definition read::"state \<Rightarrow> state" where 
"read s = s"

end
